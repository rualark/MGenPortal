<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/ajax.php";

$title = "$site_name: Privacy Policy";

login();

include "template/menu.php";

echo "<div class=container>";

require_once "template/privacy.php";
include "template/footer.php";

?>