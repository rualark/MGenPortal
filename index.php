<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$title = "Composer Tracker";

if (login()) {
  //echo "Your session is logged in, $ua[u_name]<br>";
  //echo "<a href='login.php?action=out'>Sign out</a>";
}
else {
  //echo "Hello guest! Please <a href='login.php'>login</a> or register:<br>";
  //show_reg_form();
}

include "template/menu.php";
if ($uid) {
  include "template/main.php";
}
else {
  include "template/guest.php";
}
include "template/footer.php";
?>
