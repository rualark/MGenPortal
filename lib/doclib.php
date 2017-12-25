<?php
require_once __DIR__ . "/../plugin/parsedown/parsedown.php";

$docs_title = "";
$docs_group = "";
$docs_text = "";
$docs_parsed = "";

function parse_docs() {
  GLOBAL $docs_menu;
  $path = "docs";
  if ($handle = opendir($path)) {
    while (false !== ($entry = readdir($handle))) {
      if ($entry != "." && $entry != "..") {
        $fa = file("$path/$entry");
        $docs_group = trim($fa[0], "# \t\n\r\0\x0B");
        $docs_title = trim($fa[1], "# \t\n\r\0\x0B");
        $docs_menu[$docs_group][bfname($entry)] = $docs_title;
      }
    }
    closedir($handle);
  }
}

function show_docs_menu() {
  GLOBAL $docs_menu;
  echo "<div class='col-sm-3'>";
  echo "<div class='panel panel-default'>";
  echo "<div class='panel-body'>";
  $first = 1;
  foreach($docs_menu as $group => $val) {
    if (!$first) echo "<br>";
    $first = 0;
    echo "$group<br>";
    asort($val);
    foreach($val as $bfn => $title) {
      //if ($bfn == "index") continue;
      echo "&nbsp;&nbsp;&nbsp;<a href='docs.php?d=$bfn'>$title</a><br>";
    }
  }
  echo "</div>";
  echo "</div>";
  echo "</div>";
}

function show_docs() {
  GLOBAL $docs_parsed;
  echo "<div class='col-sm-9'>";
  echo $docs_parsed;
  echo "</div>";
}

function get_docs($fname) {
  GLOBAL $docs_title, $docs_group, $docs_text, $docs_parsed;
  $fname = str_replace("/", "", $fname);
  $docs_text = file_get_contents("docs/$fname.md");
  $sa = explode("\n", $docs_text);
  $docs_group = $sa[0];
  $docs_title = $sa[1];
  $docs_group = trim($docs_group, "# \t\n\r\0\x0B");
  $docs_title = trim($docs_title, "# \t\n\r\0\x0B");
  // Parse
  $docs_text = substr($docs_text, strpos($docs_text, "\n"));
  $Parsedown = new Parsedown();
  $docs_parsed = $Parsedown->text($docs_text);
  // Bootstrap
  $docs_parsed = str_replace("<table>", "<table class=table>", $docs_parsed);
}
?>