<?php
$site_name = "Composer Tracker";

function secure_variable($st) {
  GLOBAL $ml;
  if (isset($_GET[$st])) return mysqli_real_escape_string($ml, $_GET[$st]);
  return "";
}

function secure_variable_post($st) {
  GLOBAL $ml;
  if (isset($_POST[$st])) return mysqli_real_escape_string($ml, $_POST[$st]);
  return "";
}

function start_time() {
  GLOBAL $starttime, $starttime2;
  $mtime = microtime();
  $mtime = explode(" ",$mtime);
  $mtime = $mtime[1] + $mtime[0];
  if ($starttime2 == 0) $starttime2 = $mtime;
  $starttime = $mtime;
}

function stop_time($st="", $show=1) {
  GLOBAL $starttime, $starttime2, $view_child;
  // Show run time
  $mtime = microtime();
  $mtime = explode(" ",$mtime);
  $mtime = $mtime[1] + $mtime[0];
  $endtime = $mtime;
  $totaltime = round($endtime - $starttime, 3);
  $totaltime2 = round($endtime - $starttime2, 3);
  if ($show>0) {
    echo "<p>The script ran ".$totaltime." seconds ";
    if ($totaltime2>$totaltime) echo "($totaltime2 total) ";
    echo "$st. ";
  }
  // Set all subsequent views to child
  $view_child=1;
  // Restart timer
  start_time();
}

// Get base filename
function bfname($st) {
  return substr($st, 0, strrpos($st, "."));
}

function human_pass($s) {
  if ($s < 60) return "$s seconds";
  else if ($s < 3600) return round($s/60) . " minutes";
  else if ($s < 3600*24) return round($s/3600) . " hours";
  else if ($s < 3600*24*30) return round($s/3600/24) . " days";
  else if ($s < 3600*24*365) return round($s/3600/24/30) . " months";
  else return round($s/3600/24/365) . " years";
}

?>