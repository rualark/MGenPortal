<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$login = secure_variable_post("login");
$password = secure_variable_post("password");
$log_in = secure_variable_post("log_in");
$action = secure_variable("action");

if($action == "out") {
  logout();
  exit;
}

if (login()) {
  echo "Your session is logged in<br>";
  die ("<script language=javascript>location.replace('index.php');</script>");
}
else {
  if(isset($_POST['log_in'])) {
    if (enter()) {
      echo "You logged in successfully<br>";
      die ("<script language=javascript>location.replace('index.php');</script>");
    }
    else {
    }
  }
}

if (!$uid) {
  include "template/menu.php";
  include "template/login.php";
  include "template/footer.php";
  //echo "<form action=login.php method=post>";
  //echo "Login: ";
  //echo "<input type=text name=login /><br>";
  //echo "Password: ";
  //echo "<input type=password name=password /><br>";
  //echo "<input type=submit value=login name=log_in />";
  //echo "</form>";
  //echo md5(md5("service")."265");
}

?>
