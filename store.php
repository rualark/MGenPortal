<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$action = secure_variable_post("action");
$f_id = secure_variable_post("f_id");
$f_type = secure_variable_post("f_type");
$f_private = secure_variable_post("f_private");

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
  // Remove jobs
  mysqli_query($ml,"DELETE FROM jobs WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  load_file();
  create_jobs();
  die ("<script language=javascript>location.replace('upload.php?f_id=$f_id');</script>");
}

die ("<script language=javascript>location.replace('index.php');</script>");

?>