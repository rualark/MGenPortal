<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "$site_name: Upload";

if (!login()) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

include "template/menu.php";

show_status();

include "template/footer.php";
?>
