<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "Composer Tracker: Uploads";

login();

include "template/menu.php";

echo "<div class=container>";
echo "<br><h2 align=center>Uploads</h2>";
show_uploads();
include "template/footer.php";
?>
