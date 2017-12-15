<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$title = "$site_name";

login();

include "template/menu.php";
if ($uid) {
  include "template/guest.php";
}
else {
  include "template/guest.php";
}
include "template/footer.php";
?>
