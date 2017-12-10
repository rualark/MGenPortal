<?php
function show_uploads() {
  GLOBAL $ml, $uid;
  echo "<table class='table'>";
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>Uploaded</th>";
  echo "<th scope=col style='text-align: center;'>User</th>";
  echo "<th scope=col style='text-align: center;'>MIDI</th>";
  echo "<th scope=col style='text-align: center;'>Analysis</th>";
  echo "<th scope=col style='text-align: center;'>Correction</th>";
  echo "<th scope=col style='text-align: center;'>MP3</th>";
  echo "</tr>\n";
  $cond = "";
  if ($uid) $cond = " AND u_id='$uid'";
  $r = mysqli_query($ml, "SELECT * FROM files 
    LEFT JOIN users USING (u_id)
    WHERE 1=1 $cond 
    ORDER BY f_time DESC");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    echo "<tr>";
    echo "<td align='center'>$w[f_time]</td>";
    echo "<td align='center'>$w[u_name]</td>";
    echo "<td align='center'><img height=24 src='img/midi.png'</td>";
    echo "<td align='center'><img height=24 src='img/pdf.png'</td>";
    echo "<td align='center'><img height=24 src='img/pdf.png'</td>";
    echo "<td align='center'><img height=24 src='img/mp3.png'</td>";
    echo "</tr>\n";
  }
  echo "</table>";
}
?>
