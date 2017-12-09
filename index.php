<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

if (login()) {
  echo "Your session is logged in, $ua[u_name]<br>";
  echo "<a href='login.php?action=out'>Sign out</a>";
}
else {
  echo "Hello guest! Please <a href='login.php'>login</a><br>";
}
?>
