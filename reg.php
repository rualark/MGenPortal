<?php
require_once "lib/lib.php";
require_once "lib/config.php";
require_once "lib/auth.php";

$name = secure_variable_post("name");
$login = secure_variable_post("login");
$password = secure_variable_post("password");

if (login()) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

if (isset($_POST['register'])) {
  $salt = mt_rand(100000, 999999);
  $pass_md5 = md5(md5($password).$salt);
  mysqli_query($ml, "INSERT INTO user (u_login,u_pass,u_salt,u_name,u_regtime) 
    VALUES ('$login','$pass_md5','$salt','$name',NOW())");
  echo mysqli_error($ml);
  enter();
  die ("<script language=javascript>location.replace('index.php');</script>");
}
else {
  show_reg_form();
}
?>