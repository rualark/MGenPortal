<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "$site_name: File";
$f_id = secure_variable("f_id");

login();
load_file();

if ($f_id == 0) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

include "template/menu.php";
if ($uid != $wf['u_id'] && $wf['f_private']) {
  echo "<p class=text-danger><b>Sorry, you do not have access to this upload, because it was marked private by user.</b></p>";
}

show_upload();
echo "<br><h3>Processing of this file:</h3><br>";
show_jobs($f_id);

include "template/footer.php";
?>
