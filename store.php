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
  load_active_jobs();
  parse_jobs_config();
  deactivate_all_jobs();
  $create_cause = "Changed file type";
  create_jobs($f_type);
  delete_old_drafts();
  load_active_jobs();
  inject_config($waj[2], "Instruments", $caa[2]['instruments']);
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
  // Build f_instruments
  for ($i=0; $i<$MAX_INSTR; ++$i) {
    if (!isset($_POST["isel$i"])) break;
    if ($f_instruments != "") $f_instruments .= ",";
    $f_instruments .= $_POST["isel$i"];
  }
  // Update field
  mysqli_query($ml,"UPDATE files SET f_instruments='$f_instruments' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  load_file();
  load_active_jobs();
  // Recreate job if it is not draft already
  if (isset($waj[2]) && $waj[2]['j_state'] > 0) {
    deactivate_jobs(2);
    $create_cause = "Changed instruments";
    create_jobs($wf['f_type'], 2);
    copy_job_config(2);
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
  // Check authority
  if ($wf['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  load_active_jobs();
  parse_jobs_config();
  $f_instruments = change_ilist_len($caa[2]['instruments'], $ilist_size);
  //mysqli_query($ml,"UPDATE files SET f_instruments='$f_instruments' WHERE f_id='$f_id'");
  //echo mysqli_error($ml);
  inject_config($waj[2], "Instruments", $f_instruments);
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

if ($action == "jconfig" && $j_id && $uid) {
  $jconfig = stripslashes(str_replace("\\r\\n", "\r\n", $jconfig));
  // Check authority
  load_job();
  if ($wj['u_id'] != $uid) {
    die ("<script language=javascript>location.replace('index.php');</script>");
  }
  load_file();
  if ($wj['j_state'] > 0) {
    deactivate_job();
    $create_cause = "Changed config file";
    $j_id = create_job($wj['j_type'], $wj['j_class'], $wj['j_timeout'], $wj['j_timeout2'],
      $wj['j_priority'], $wj['j_engrave'], $wj['j_render']);
    copy_job_config($wj['j_class']);
    delete_old_drafts();
    load_job();
  }
  save_job_config();
  die ("<script language=javascript>location.replace('job.php?j_id=$j_id');</script>");
}

die ("<script language=javascript>location.replace('index.php');</script>");

?>