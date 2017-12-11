<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$action = secure_variable_post("action");
$f_id = secure_variable_post("f_id");
$f_type = secure_variable_post("f_type");
$f_private = secure_variable_post("f_private");
$f_instruments = secure_variable_post("f_instruments");

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
  load_file();
  load_active_jobs();
  // Recreate job if it is not draft already
  if (isset($wj[2]) && $wj[2]['j_state'] > 0) {
    deactivate_jobs_mp();
    create_jobs_mp();
    copy_job("MP1", 2);
    delete_old_drafts();
    load_active_jobs();
  }
  if (isset($wj[2])) {
    inject_config(2, "Instruments", $f_instruments);
  }
  echo mysqli_error($ml);
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

die ("<script language=javascript>location.replace('index.php');</script>");

?>