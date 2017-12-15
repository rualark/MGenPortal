<?php
require_once "lib.php";

$bheight = 24;
$bheight2 = 36;
$wf = 0;
$wj = 0;
$waj = 0;

$ftypes = array(
  'CA1' => "Cantus firmus",
  'CA2' => "Counterpoint species 1-5, 2 voices",
  'MP1' => "Other"
);

$ftypes2 = array(
  'CA1' => "Cantus",
  'CA2' => "Counterpoint",
  'MP1' => "Any"
);

$jclasses = array(
  0 => "Analyse",
  1 => "Correct",
  2 => "Perform",
  3 => "Generate"
);

$vtypes = array(
  0 => "Public",
  1 => "Group",
  2 => "Private"
);

$default_ilist = "Piano";

function furl($w) {
  return $w['f_folder'] . $w['f_name'];
}

function bfurl($w) {
  $pp = pathinfo(furl($w));
  return $pp['dirname']."/".$pp['filename'];
}

function jurl($w) {
  return $w['j_folder'] . $w['f_name'];
}

function bjurl($w) {
  $pp = pathinfo(jurl($w));
  return $pp['dirname']."/".$pp['filename'];
}

function load_file() {
  GLOBAL $f_id, $ml, $wf;
  $r = mysqli_query($ml, "SELECT * FROM files 
    LEFT JOIN users USING (u_id)
    WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  $wf = mysqli_fetch_assoc($r);
}

function load_job() {
  GLOBAL $j_id, $ml, $wj, $f_id;
  $r = mysqli_query($ml, "SELECT * FROM jobs
    LEFT JOIN files USING (f_id) 
    LEFT JOIN users USING (u_id)
    WHERE j_id='$j_id'");
  echo mysqli_error($ml);
  $wj = mysqli_fetch_assoc($r);
  $f_id = $wj['f_id'];
}

function load_job_config() {
  GLOBAL $wj, $jconfig;
  $jconfig = file_get_contents("share/" . $wj['j_folder'] . bfname($wj['f_name']) . ".pl");
}

function save_job_config() {
  GLOBAL $wj, $jconfig;
  file_put_contents("share/" . $wj['j_folder'] . bfname($wj['f_name']) . ".pl", $jconfig);
}

function load_active_jobs() {
  GLOBAL $f_id, $ml, $waj;
  $waj = array();
  $r = mysqli_query($ml, "SELECT * FROM jobs
    LEFT JOIN files USING (f_id) 
    LEFT JOIN users USING (u_id)
    WHERE jobs.f_id='$f_id' AND j_deleted=0");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    $waj[$w['j_class']] = $w;
  }
}

function get_typename($t) {
  if ($t == 'CA2') return 'Counterpoint';
  if ($t == 'CA1') return 'Cantus';
  return 'Other';
}

function create_job($j_type, $j_class, $j_timeout, $j_timeout2, $j_priority, $j_engrave, $j_render) {
  GLOBAL $ml, $uid, $f_id, $wf;
  // Create job draft
  mysqli_query($ml, "INSERT INTO jobs 
    (j_added, j_priority, j_type, j_class, f_id, j_timeout, j_timeout2, 
    j_engrave, j_render)
    VALUES(NOW(), '$j_priority', '$j_type', '$j_class', '$f_id', '$j_timeout', '$j_timeout2', 
    '$j_engrave', '$j_render')");
  echo mysqli_error($ml);
  // Set job folder
  $j_id = mysqli_insert_id($ml);
  $j_folder = "jobs/" . date("Y/m-d") . "/$uid-$j_id/";
  mysqli_query($ml, "UPDATE jobs SET j_folder='$j_folder' WHERE j_id='$j_id'");
  echo mysqli_error($ml);
  mkdir("share/" . substr($j_folder, 0, strlen($j_folder) - 1), 0777, true);
  // Copy config
  $fname_pl = "share/$j_folder".bfname($wf['f_name']).".pl";
  copy("share/configs/Gen$j_type.pl", $fname_pl);
  // Append midi file to config if not generating
  file_put_contents($fname_pl, "\n", FILE_APPEND);
  if ($j_class < 3) {
    file_put_contents($fname_pl, "Midi_file = server\\midi\\" . $wf['f_name'] . "\n", FILE_APPEND);
    // Append correct to config if correcting
    if ($j_class  == 1) {
      $wj['j_folder'] = $j_folder;
      $wj['f_name'] = $wf['f_name'];
      inject_config($wj, "corrections", "1", "Enable correcting scores");
    }
  }
  return $j_id;
}

function inject_config($wj, $tag, $value, $comm="") {
  $fname_pl =  "share/".$wj['j_folder'] . bfname($wj['f_name']).".pl";
  // Read config
  $fa = file($fname_pl);
  // Write config without tag
  $fh = fopen($fname_pl, 'w');
  for ($i=0; $i<count($fa); ++$i) {
    if (stripos($fa[$i], "$tag ") === 0 || stripos($fa[$i], "$tag=") === 0) continue;
    fwrite($fh, $fa[$i]);
  }
  // Write tag
  $st = "$tag = $value";
  if ($comm != "") $st .= " # $comm";
  fwrite($fh, "$st\n");
  fclose($fh);
}

function copy_job($j_type, $j_class) {
  GLOBAL $f_id, $ml;
  $r = mysqli_query($ml, "SELECT * FROM jobs 
    LEFT JOIN files USING (f_id) 
    WHERE j_class='$j_class' AND j_type='$j_type' AND f_id='$f_id'
    ORDER BY j_added DESC");
  echo mysqli_error($ml);
  $w = mysqli_fetch_assoc($r);
  $w2 = mysqli_fetch_assoc($r);
  if (!$w['j_id'] || !$w2['j_id']) return;
  $fname_pl =  "share/$w[j_folder]".bfname($w['f_name']).".pl";
  $fname_pl2 = "share/$w2[j_folder]".bfname($w2['f_name']).".pl";
  copy($fname_pl2, $fname_pl);
}

function create_jobs_mp() {
  create_job("MP1", 2, 300, 340, 2, 0, 600);
}

function create_jobs_ca() {
  GLOBAL $wf;
  if ($wf['f_type'] == "CA1") {
    create_job("CA1", 0, 60, 80, 1, 600, 0);
    create_job("CA1", 1, 600, 640, 1, 600, 0);
  }
  if ($wf['f_type'] == "CA2") {
    create_job("CA2", 0, 60, 80, 1, 600, 0);
    create_job("CA2", 1, 600, 640, 1, 600, 0);
  }
}

function copy_jobs_ca() {
  GLOBAL $wf;
  copy_job($wf['f_type'], 0);
  copy_job($wf['f_type'], 1);
}

function copy_jobs_mp() {
  GLOBAL $wf;
  copy_job($wf['f_type'], 2);
}

function deactivate_job() {
  GLOBAL $j_id, $ml;
  mysqli_query($ml, "UPDATE jobs SET j_deleted=1 WHERE j_id='$j_id'");
  echo mysqli_error($ml);
}

function deactivate_jobs_mp() {
  GLOBAL $f_id, $ml;
  mysqli_query($ml, "UPDATE jobs SET j_deleted=1 WHERE f_id='$f_id' AND j_class=2");
  echo mysqli_error($ml);
}

function deactivate_jobs_ca() {
  GLOBAL $f_id, $ml;
  mysqli_query($ml, "UPDATE jobs SET j_deleted=1 WHERE f_id='$f_id' AND j_class<2");
  echo mysqli_error($ml);
}

function delete_old_drafts() {
  GLOBAL $f_id, $ml;
  // Delete deactivated drafts
  mysqli_query($ml, "DELETE FROM jobs WHERE f_id='$f_id' AND j_state=0 AND j_deleted=1");
  echo mysqli_error($ml);
}

?>