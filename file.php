<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/ajax.php";

$title = "$site_name: File";
$f_id = secure_variable("f_id");

login();
load_file();

if ($f_id == 0) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

load_active_jobs();
parse_jobs_config();

include "template/menu.php";
if ($uid != $wf['u_id'] && $wf['f_private'] && !$ua['u_admin']) {
  echo "<p class=text-danger><b>Sorry, you do not have access to this upload, because it was marked private by user.</b></p>";
  exit;
}

show_upload();

echo "<br>";
echo "<hr>";
echo "<br>";
echo "<div class=row>";
echo "<div class='col-sm-6'>";
echo "<h3>Results:</h3>";
echo "</div>";
echo "<div class='col-sm-6 text-right'>";
load_active_jobs();
$actives = ($waj[0] && !$waj[0]['j_state']) +
  ($waj[1] && !$waj[1]['j_state']) +
  ($waj[2] && !$waj[2]['j_state']);
if ($actives) {
  echo "<a class=\"btn btn-success btn-lg\" href=\"store.php?action=start&f_id=$f_id\" role=\"button\">Start $actives pending jobs</a>";
}
echo "</div>";
echo "</div>";
echo "<br>";
show_jobs($f_id);

include "template/footer.php";
periodic_update("ajax/jstate.php?f_id=$f_id", 1000);
?>
