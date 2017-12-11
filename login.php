<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$login = secure_variable_post("login");
$password = secure_variable_post("password");
$log_in = secure_variable_post("log_in");
$action = secure_variable("action");

$title = "Login to $site_name";

if($action == "out") {
  logout();
  exit;
}

if (login()) {
  //echo "Your session is logged in<br>";
  die ("<script language=javascript>location.replace('index.php');</script>");
}
else {
  if(isset($_POST['log_in'])) {
    if (enter()) {
      //echo "You logged in successfully<br>";
      die ("<script language=javascript>location.replace('index.php');</script>");
    }
  }
}

if (!$uid) {
  include "template/menu.php";
  include "template/login.php";
  include "template/footer.php";
}

?>
