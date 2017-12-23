<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/ajax.php";

$title = "$site_name: Uploads";

login();

include "template/menu.php";

echo "<div class=container>";
echo "<br><h2 align=center>Uploaded files</h2>";
show_uploads();
include "template/footer.php";

if ($uid) periodic_update("ajax/jstate.php?u_id=$uid", 1000);
?>
