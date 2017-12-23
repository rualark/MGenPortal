<?php
require_once "../lib/mlib.php";
require_once "../lib/config.php";
require_once "../lib/reports.php";

$u_id = secure_variable("u_id");
$f_id = secure_variable("f_id");
$j_id = secure_variable("j_id");

if ($j_id) $cond = "j_id='$j_id'";
else if ($f_id) $cond = "f_id='$f_id' AND j_deleted=0 || j_updated > DATE_SUB(NOW(), INTERVAL 5 SECOND)";
else $cond = "j_updated > DATE_SUB(NOW(), INTERVAL 5 SECOND)";

$r = mysqli_query($ml, "SELECT * FROM jobs 
  LEFT JOIN files USING (f_id)
  WHERE $cond");
//   LEFT JOIN s_status ON (s_status.s_id = jobs.s_id)
$n = mysqli_num_rows($r);
for ($i=0; $i<$n; ++$i) {
  $wj = mysqli_fetch_assoc($r);
  if ($i > 0) echo "^";
  if ($j_id || $f_id) {
    echo "js$wj[j_id]|";
    echo show_job_icon($wj, 1);
    echo "^jr$wj[j_id]|";
    echo show_job_icon($wj, 2);
    if ($j_id) {
      echo "^jp$wj[j_id]|$wj[j_progress]";
      //echo "^jsc$wj[j_id]|<a href='share/screen$wj[s_id]-$wj[screenshot_id].png' target=_blank><img src='share/screen$wj[s_id]-$wj[screenshot_id].png'";
      //echo " class='img-fluid img-thumbnail'></a>";
    }
  }
  else {
    echo "jc$wj[j_id]|";
    echo show_job_icon($wj);
  }
}
?>