<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

if (login()) {
  echo "Your session is logged in<br>";
  echo "<a href='login.php?action=out'>Sign out</a>";
}
else {
  if(isset($_POST['log_in'])) {
    if (enter()) {
      echo "Error logging in";
    }
    else {
      echo "You logged in successfully<br>";
      die ("<script language=javascript>location.replace('index.php');</script>");
    }
  }
  else {
    echo "Hello guest! Please <a href='login.php'>login</a><br>";
  }
}

?>
