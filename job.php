<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/ajax.php";

$title = "$site_name: Job";
$j_id = secure_variable("j_id");

login();

include "template/menu.php";
load_job();
load_job_config();

if ($uid != $wj['u_id'] && $wj['f_private'] && !$ua['u_admin']) {
  echo "<p class=text-danger><b>Sorry, you do not have access to this upload, because it was marked private by user.</b></p>";
  exit;
}

echo "<br>";
echo "<div class=container>";

show_job();
show_job_editor();

include "template/footer.php";
periodic_update("ajax/jstate.php?j_id=$j_id", 1000);
?>