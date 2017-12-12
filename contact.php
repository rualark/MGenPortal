<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$title = "$site_name: Contact";

login();

include "template/menu.php";
include "template/contact.php";
include "template/footer.php";
?>
