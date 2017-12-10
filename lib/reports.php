<?php

function show_job($w, $c) {
  GLOBAL $bheight;
  if (!$w['j_id']) return "-";
  if ($w['j_state'] == 0)
    return "<a title='Need to manually start this job' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/draft.png>";
  if ($w['j_state'] == 1)
    return "<a title='Job is waiting in queue for vacant server' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/pause.png>";
  if ($w['j_state'] == 2)
    return "<a title='Job is running on server' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/play.png>";
  if ($w['j_state'] == 3 && $w['j_result'])
    return "<a title='Job completed with errors. Click to see' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/stop.png>";
  if ($c == 2)
    return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".mp3'><img height=$bheight src='img/mp3.png'></a>";
  else return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".pdf'><img height=$bheight src='img/pdf.png'></a>";
}

function show_uploads() {
  GLOBAL $ml, $uid;
  echo "<table class='table table-hover'>"; // table-striped
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>Uploaded</th>";
  echo "<th scope=col style='text-align: center;'>User</th>";
  echo "<th scope=col style='text-align: center;'>File</th>";
  echo "<th scope=col style='text-align: center;'>Analysis</th>";
  echo "<th scope=col style='text-align: center;'>Correction</th>";
  echo "<th scope=col style='text-align: center;'>MP3</th>";
  echo "</tr>\n";
  echo "</thead>";
  echo "<tbody>";
  if ($uid) $cond = " AND u_id='$uid'";
  else $cond = " AND f_private=0";
  $r = mysqli_query($ml, "SELECT * FROM files 
    LEFT JOIN users USING (u_id)
    WHERE 1=1 $cond 
    ORDER BY f_time DESC
    LIMIT 100");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    echo "<tr>";
    echo "<td align='center'><a href='upload.php?f_id=$w[f_id]'>$w[f_time]</td>";
    echo "<td align='center'>$w[u_name]</td>";
    echo "<td align='center'><a target=_blank href='share/" . furl($w) . "'>$w[f_name]</td>";
    $r2 = mysqli_query($ml, "SELECT * FROM jobs WHERE f_id='$w[f_id]' ORDER BY j_added");
    echo mysqli_error($ml);
    $n2 = mysqli_num_rows($r2);
    $wa = array();
    for ($x=0; $x<$n2; ++$x) {
      $w2 = mysqli_fetch_assoc($r2);
      $wa[$w2['j_class']] = $w2;
      $wa[$w2['j_class']]['f_name'] = $w['f_name'];
    }
    echo "<td align=center>";
    echo show_job($wa[0], 0);
    echo "<td align=center>";
    echo show_job($wa[1], 1);
    echo "<td align=center>";
    echo show_job($wa[2], 2);
    echo "</tr>\n";
  }
  echo "</tbody>";
  echo "</table>";
}

function show_upload() {
  GLOBAL $uid, $f_id, $wf, $ftypes;
  echo "<div class=container>";
  echo "<br><h2 align=center>$wf[f_name] uploaded by $wf[u_name]</h2>";
  echo "<hr>";
  if ($uid == $wf['u_id']) {
    echo "<form action=store.php method=post>";
    echo "<input type=hidden name=f_id value='$f_id'>";
    echo "<input type=hidden name=action value=f_type>";
    echo "<b>Type:</b> ";
    echo "<select class=\"custom-select\" name=f_type onChange='this.form.submit();'>";
    foreach ($ftypes as $key => $val) {
      echo "<option value=$key";
      if ($key == $wf['f_type']) echo " selected";
      echo ">$val</option>";
    }
    echo "</select>";
    echo "</form>";
  } else {
    echo "<p><b>Type:</b> " . get_typename($wf['f_type']) . "</p>";
  }
  echo "<p><b>Visibility:</b> ";
  if ($wf['f_private']) echo "private";
  else echo "public";
  echo "</p>";
  echo "<p><b>Upload time:</b> $wf[f_time]</p>";
}

function show_jobs($f_id) {
  GLOBAL $ml, $ftypes;
  echo "<table class='table table-hover'>"; // table-striped
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>State</th>";
  echo "<th scope=col style='text-align: center;'>Job created</th>";
  echo "<th scope=col style='text-align: center;'>Job started</th>";
  echo "<th scope=col style='text-align: center;'>Duration (s)</th>";
  echo "<th scope=col style='text-align: center;'>Type</th>";
  echo "<th scope=col style='text-align: center;'>Class</th>";
  echo "</tr>\n";
  echo "</thead>";
  echo "<tbody>";
  if ($f_id) $cond = " AND f_id='$f_id'";
  else $cond = " AND f_private=0";
  $r = mysqli_query($ml, "SELECT * FROM jobs
    LEFT JOIN files USING (f_id) 
    LEFT JOIN users USING (u_id)
    WHERE 1=1 $cond 
    ORDER BY j_added DESC, j_class
    LIMIT 100");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    echo "<tr>";
    echo "<td align=center>";
    echo show_job($w, $w['j_class']);
    echo "<td align='center'><a href='job.php?j_id=$w[j_id]'>$w[j_added]</td>";
    echo "<td align='center'>";
    if ($w['j_started'] + 0) echo "$w[j_started]</td>";
    else echo "-";
    echo "<td align='center'>";
    if ($w['j_duration']) echo "$w[j_duration]";
    else echo "-";
    echo "<td align='center'>$w[j_type]</td>";
    echo "<td align='center'>$w[j_class]</td>";
    echo "</tr>\n";
  }
  echo "</tbody>";
  echo "</table>";
}

?>
