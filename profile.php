<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "$site_name: Profile";

if (!login()) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

include "template/menu.php";

echo "<div class=container>";
echo "<h3>Here you will be able to change your profile details. This page is not implemented yet. You can change password by signing out and clicking 'Forgot password'</h3>";

include "template/footer.php";
?>
