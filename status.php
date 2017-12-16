<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$s_id = secure_variable("s_id");

$title = "$site_name: Status";

if (!login()) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

include "template/menu.php";

show_status($s_id);

include "template/footer.php";
?>
