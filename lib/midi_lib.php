<?php
require_once __DIR__ . "/../plugin/midiclass/midi.class.php";

$midiclass = new Midi();
$track_count = 0;
$track_name = 0;
$track_name = array();

function load_midifile($f_folder, $fname) {
  GLOBAL $midiclass;
  $midiclass->importMid("share/" . $f_folder . $fname);
}

function get_tracknames() {
  GLOBAL $midiclass, $track_count, $track_name;
  $track_count = $midiclass->getTrackCount();
  $track_name = array();
  for ($i=0; $i<$track_count; ++$i) {
    $track = $midiclass->getTrack($i);
    foreach ($track as $key => $val) {
      $sa = explode(" ", $val);
      if ($sa[1] == "Meta" && $sa[2] == "TrkName") {
        for ($x=3; $x<count($sa); ++$x) {
          if ($track_name[$i] != "") $track_name[$i] .= " ";
          $track_name[$i] .= $sa[$x];
        }
        if ($track_name[$i][0] == "\"")
          $track_name[$i] = substr($track_name[$i], 1, 1000);
        if ($track_name[$i][strlen($track_name[$i]) - 1] == "\"")
          $track_name[$i] = substr($track_name[$i], 0, strlen($track_name[$i]) - 1);
        break;
      }
    }
  }
}

?>