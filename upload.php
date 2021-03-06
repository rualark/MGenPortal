<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";
require_once "lib/midi_lib.php";

$title = "$site_name: Upload";
$upload_error = "";

if (!login()) {
  die ("<script language=javascript>location.replace('index.php');</script>");
}

if (isset($_POST['submit'])) {
  $submit = $_POST['submit'];
  $p=$_POST['submit'];
}

function upload_file() {
  GLOBAL $upload_error, $ml, $uid, $waj, $default_ilist, $f_id, $create_cause, $midiclass,
  $track_count, $track_name;
  if ($_FILES["file"]["error"] > 0) {
    $upload_error = "Error: " . $_FILES["file"]["error"];
    return 1;
  }
  if ($_FILES["file"]["size"] == 0) {
    $upload_error = "Selected file is empty. Please select another file.";
    return 1;
  }
  $fname = $_FILES["file"]["name"];
  $pp = pathinfo($fname);
  if ($pp['extension'] != 'mid' && $pp['extension'] != 'midi') {
    $upload_error = "Wrong file extension: only mid and midi extensions are accepted";
    return 1;
  }
  $tmpname = $_FILES["file"]["tmp_name"];
  $fname2 = str_replace(" ", "_", $fname);
  $fname2 = str_replace(".midi", ".mid", $fname2);
  $fname2 = preg_replace('/[^0-9a-zA-Z_\-\.]/',"",$fname2);
  if (strlen($fname2) < 7) $fname2 = date("Y-m-d-") . $fname2;
  $f_type = "MP1";
  // Insert into sql
  mysqli_query($ml, "INSERT INTO files 
    (f_name, f_time, f_private, u_id, f_format, f_source, f_type, f_store)
    VALUES('".mysqli_escape_string($ml, $fname2)."', NOW(), 0, '$uid', 'MIDI', '$fname', '$f_type', 31)");
  echo mysqli_error($ml);
  // Set job folder
  $f_id = mysqli_insert_id($ml);
  $f_folder = "upload/" . date("Y/m-d") . "/$uid-$f_id/";
  mysqli_query($ml, "UPDATE files SET f_folder='$f_folder' WHERE f_id='$f_id'");
  echo mysqli_error($ml);
  mkdir("share/" . substr($f_folder, 0, strlen($f_folder) - 1), 0777, true);
  // Copy file
  copy($tmpname, "share/" . $f_folder . $fname2);

  load_file();
  // Create jobs
  $create_cause = "Upload new file";
  create_jobs($f_type);
  load_active_jobs();
  inject_config($waj[2], "Instruments", $default_ilist);

  // Load midi file
  $midiclass->importMid("share/" . $f_folder . $fname2);
  get_tracknames();
  if ($track_count) {
    mysqli_query($ml, "UPDATE files SET 
      f_icount='$track_count', f_name0='".mysqli_escape_string($ml, $track_name[0])."' 
      WHERE f_id='$f_id'");
    echo mysqli_error($ml);
    mysqli_query($ml, "DELETE FROM finstr WHERE f_id='$f_id'");
    echo mysqli_error($ml);
    if ($track_count > 1) {
      for ($i = 1; $i < $track_count; ++$i) {
        mysqli_query($ml, "REPLACE INTO finstr (f_id, i_lid, i_name) 
          VALUES('$f_id', '$i', '" . mysqli_escape_string($ml, $track_name[$i]) . "')");
        echo mysqli_error($ml);
      }
      load_instruments();
      $ilist = map_instruments();
      inject_config($waj[2], "Instruments", $ilist);
    }
  }

  //echo "New name: $fname2<br>";
  //echo "Upload: " . $_FILES["file"]["name"] . "<br />";
  //echo "Type: " . $_FILES["file"]["type"] . "<br />";
  //echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";
  //echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";
  die ("<script language=javascript>location.replace('file.php?f_id=$f_id');</script>");
}

if (isset($submit)) {
  upload_file();
}

include "template/menu.php";

echo "<div class=container>";
echo "<div class=row>";
echo "<div class='col-sm-3'>";
echo "</div>";
echo "<div class='col-sm-6'>";
echo "<br><h1 align='center'>Upload new MIDI file</h1> <br>";
echo "<form action=upload.php method=post enctype='multipart/form-data'>";
echo "<p align=center>";
echo "<input class='form-control' type=file id=file name='file'>";
echo "<p align=center class='text-danger'>$upload_error";
echo "<p align=center>";
echo "<button type=submit value=submit name=submit class='btn btn-primary'>Upload</button>";
echo "</form>";
echo "</div>";
echo "<div class='col-sm-3'>";
echo "</div>";
echo "</div>";


include "template/footer.php";
?>
