<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "Composer Tracker: Uploads";

login();

include "template/menu.php";
include "template/uploads.php";
show_uploads();
include "template/footer.php";
?>
