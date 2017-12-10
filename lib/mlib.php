<?php
require_once "lib.php";

$bheight = 24;
$wf = 0;

$ftypes = array(
  'CA1' => "Cantus firmus",
  'CA2' => "Counterpoint species 1-5, 2 voices",
  'MP1' => "Other"
);

function bfname($st) {
  return substr($st, 0, strrpos($st, "."));
}

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
  GLOBAL $j_id, $ml, $wj;
  $r = mysqli_query($ml, "SELECT * FROM jobs
    LEFT JOIN files USING (f_id) 
    LEFT JOIN users USING (u_id)
    WHERE j_id='$j_id'");
  echo mysqli_error($ml);
  $wj = mysqli_fetch_assoc($r);
}

function get_typename($t) {
  if ($t == 'CA2') return 'Counterpoint';
  if ($t == 'CA1') return 'Cantus';
  return 'Other';
}

function create_job($j_type, $j_class, $j_timeout, $j_timeout2, $j_engrave, $j_render) {
  GLOBAL $ml, $ua, $uid, $f_id, $wf;
  // Create job draft
  mysqli_query($ml, "INSERT INTO jobs 
    (j_added, j_priority, j_type, j_class, f_id, j_timeout, j_timeout2, 
    j_engrave, j_render)
    VALUES(NOW(), 1, '$j_type', '$j_class', '$f_id', '$j_timeout', '$j_timeout2', 
    '$j_engrave', '$j_render')");
  echo mysqli_error($ml);
  // Set job folder
  $j_id = mysqli_insert_id($ml);
  $j_folder = "jobs/" . date("Y/m-d/$uid-$j_id/");
  mysqli_query($ml, "UPDATE jobs SET j_folder='$j_folder' WHERE j_id='$j_id'");
  echo mysqli_error($ml);
  echo "share/" + substr($j_folder, 0, strlen($j_folder) - 1);
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
      file_put_contents($fname_pl, "corrections = 1 # Enable correcting score\n", FILE_APPEND);
    }
  }
  // Autostart job
  if ($ua['u_job_autostart']) {
    mysqli_query($ml, "UPDATE jobs SET j_state=1 WHERE j_id='$j_id'");
    echo mysqli_error($ml);
  }
}

function create_jobs() {
  GLOBAL $wf;
  // Always create MP1 job
  create_job("MP1", 2, 300, 340, 0, 600);
  // If algorithm is CA, create analysis and correction
  if ($wf['f_type'] == "CA1") {
    create_job("CA1", 0, 60, 80, 600, 0);
    create_job("CA1", 1, 600, 640, 600, 0);
  }
  if ($wf['f_type'] == "CA2") {
    create_job("CA2", 0, 60, 80, 600, 0);
    create_job("CA2", 1, 600, 640, 600, 0);
  }
}

?>