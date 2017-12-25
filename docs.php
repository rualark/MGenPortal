<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/doclib.php";

$d = secure_variable("d");
if ($d == "") $d = "index";

login();

parse_docs();
get_docs($d);

$title = "$site_name: $docs_title";


echo "<link href='plugin/prism/prism.css' rel=stylesheet />";

include "template/menu.php";

echo "<link href='css/docs.css' rel=stylesheet />";

echo "<br>";
echo "<div class=container>";
echo "<div class=row>";
show_docs_menu();
show_docs();
echo "</div>";

include "template/footer.php";
echo "<script src='plugin/prism/prism.js'></script>";
?>
