<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/ajax.php";

$title = "$site_name: Terms and Conditions";

login();

include "template/menu.php";

echo "<div class=container>";

require_once "template/tos.php";
include "template/footer.php";

?>