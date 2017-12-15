<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

// Load POST
$action = secure_variable_post("action");
$f_id = secure_variable_post("f_id");
$j_id = secure_variable_post("j_id");
$f_type = secure_variable_post("f_type");
$f_private = secure_variable_post("f_private");
$f_instruments = secure_variable_post("f_instruments");
$jconfig = secure_variable_post("jconfig");
$ilist_size = secure_variable_post("ilist_size");

// Load GET
if (!$action) {
  $action = secure_variable("action");
  $f_id = secure_variable("f_id");
  $j_id = secure_variable("j_id");
}

login();

// Update f_type
if ($action == "f_type" && $uid && $f_id && $f_type) {
  load_file();
  // Check authority
  if ($wf['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  // Update file type
  mysqli_query($ml,"UPDATE files SET f_type='$f_type' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  load_file();
  deactivate_jobs_ca();
  create_jobs_ca();
  delete_old_drafts();
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

// Update f_private
if ($action == "f_private" && $uid && $f_id) {
  load_file();
  // Check authority
  if ($wf['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  // Update field
  mysqli_query($ml,"UPDATE files SET f_private='$f_private' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

// Update f_instruments
if ($action == "f_instruments" && $uid && $f_id) {
  load_file();
  // Check authority
  if ($wf['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  // Update field
  mysqli_query($ml,"UPDATE files SET f_instruments='$f_instruments' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  load_file();
  load_active_jobs();
  // Recreate job if it is not draft already
  if (isset($waj[2]) && $waj[2]['j_state'] > 0) {
    deactivate_jobs_mp();
    create_jobs_mp();
    copy_job("MP1", 2);
    delete_old_drafts();
    load_active_jobs();
  }
  if (isset($waj[2])) {
    inject_config($waj[2], "Instruments", $f_instruments);
  }
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

// Start jobs
if ($action == "start" && $uid && $f_id) {
  load_file();
  // Check authority
  if ($wf['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  // Update field
  mysqli_query($ml,"UPDATE jobs SET j_state=1, j_queued=NOW() WHERE f_id='$f_id' AND j_deleted=0 AND j_state=0");
  echo mysqli_error($ml);
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

// Start job
if ($action == "startjob" && $uid && $j_id) {
  load_job();
  // Check authority
  if ($wj['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  // Check state
  if ($wj['j_deleted'] || $wj['j_state'] == 1 || $wj['j_state'] == 2) {
    die ("<script language=javascript>location.replace('job.php?j_id=$j_id');</script>");
  }
  // Update field
  mysqli_query($ml,"UPDATE jobs SET j_state=1, j_queued=NOW() WHERE j_id='$j_id'");
  echo mysqli_error($ml);
  die ("<script language=javascript>location.replace('job.php?j_id=$j_id');</script>");
}

if ($action == "ilist_size" && $uid && $f_id && $ilist_size) {
  load_file();
  $wf['f_instruments'] = change_ilist_len($wf['f_instruments'], $ilist_size);
  mysqli_query($ml,"UPDATE files SET f_instruments='$wf[f_instruments]' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

if ($action == "jconfig" && $j_id && $uid) {
  $jconfig = stripslashes(str_replace("\\r\\n", "\r\n", $jconfig));
  //echo "<pre>";
  //echo $jconfig;
  load_job();
  load_file();
  if ($wj['j_state'] > 0) {
    deactivate_job();
    $j_id = create_job($wj['j_type'], $wj['j_class'], $wj['j_timeout'], $wj['j_timeout2'],
      $wj['j_priority'], $wj['j_engrave'], $wj['j_render']);
    copy_job($wj['j_type'], $wj['j_class']);
    delete_old_drafts();
    load_job();
  }
  save_job_config();
  die ("<script language=javascript>location.replace('job.php?j_id=$j_id');</script>");
}

die ("<script language=javascript>location.replace('index.php');</script>");

?>