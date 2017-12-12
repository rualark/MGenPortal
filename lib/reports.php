<?php

function show_job($w, $c, $t=0) {
  GLOBAL $bheight;
  if (!$w['j_id']) return "-";
  if ($t == 0) {
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
  if ($t == 1) {
    if ($w['j_state'] == 0)
      return "<a title='Need to manually start this job' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/draft.png>";
    if ($w['j_state'] == 1)
      return "<a title='Job is waiting in queue for vacant server' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/pause.png>";
    if ($w['j_state'] == 2)
      return "<a title='Job is running on server' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/play.png>";
    if ($w['j_state'] == 3 && $w['j_result'])
      return "<a title='Job completed with errors. Click to see' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/stop.png>";
    return "<a title='Job completed OK' href='job.php?j_id=$w[j_id]'><img height=$bheight src='img/ok.png'>";
  }
  if ($t == 2) {
    if ($w['j_state'] < 3 || $w['j_result']) return "-";
    if ($c == 2)
      return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".mp3'><img height=$bheight src='img/mp3.png'></a>";
    else return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".pdf'><img height=$bheight src='img/pdf.png'></a>";
  }
}

function show_uploads() {
  GLOBAL $ml, $uid, $ftypes2;
  echo "<table class='table table-hover'>"; // table-striped
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>Uploaded</th>";
  echo "<th scope=col style='text-align: center;'>User</th>";
  echo "<th scope=col style='text-align: center;'>File</th>";
  echo "<th scope=col style='text-align: center;'>Type</th>";
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
    echo "<td align='center'><a href='file.php?f_id=$w[f_id]'>$w[f_time]</td>";
    echo "<td align='center'>$w[u_name]</td>";
    echo "<td align='center'><a target=_blank href='share/" . furl($w) . "'>$w[f_name]</td>";
    echo "<td align='center'>".$ftypes2[$w['f_type']]."</td>";
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
  GLOBAL $uid, $ml, $f_id, $wf, $ftypes, $vtypes;
  echo "<div class=container>";
  echo "<br><h2 align=center>$wf[f_name] uploaded by $wf[u_name]</h2>";
  echo "<hr>";
  if ($uid == $wf['u_id']) {
    echo "<form action=store.php method=post>";
    echo "<input type=hidden name=f_id value='$f_id'>";
    echo "<input type=hidden name=action value=f_type>";
    echo "<div class='form-group row'>";
    echo "<label for=f_type class='col-sm-2 col-form-label'>Type:</label>";
    echo "<div class=col-sm-10>";
    echo "<select class=\"custom-select\" id=f_type name=f_type onChange='this.form.submit();'>";
    foreach ($ftypes as $key => $val) {
      echo "<option value=$key";
      if ($key == $wf['f_type']) echo " selected";
      echo ">$val</option>";
    }
    echo "</select>";
    echo "</div></div>";
    echo "</form>";

    echo "<form action=store.php method=post>";
    echo "<input type=hidden name=f_id value='$f_id'>";
    echo "<input type=hidden name=action value=f_private>";
    echo "<div class='form-group row'>";
    echo "<label for=f_private class='col-sm-2 col-form-label'>Visibility:</label>";
    echo "<div class=col-sm-10>";
    echo "<select class=\"custom-select\" id=f_private name=f_private onChange='this.form.submit();'>";
    foreach ($vtypes as $key => $val) {
      echo "<option value=$key";
      if ($key == $wf['f_private']) echo " selected";
      echo ">$val</option>";
    }
    echo "</select>";
    echo "</div></div>";
    echo "</form>";

    echo "<form action=store.php method=post>";
    echo "<input type=hidden name=f_id value='$f_id'>";
    echo "<input type=hidden name=action value=f_instruments>";
    echo "<div class='form-group row'>";
    echo "<label for=f_instruments class='col-sm-2 col-form-label'>Instruments:</label>";
    echo "<div class=col-sm-8>";

    echo "<input class='form-control' id=f_instruments type=text size=80 value='$wf[f_instruments]' name=f_instruments list='instlist'>";
    echo "<datalist id=instlist>";
    $r = mysqli_query($ml, "SELECT * FROM i_lists");
    echo mysqli_error($ml);
    $n = mysqli_num_rows($r);
    for ($i=0; $i<$n; ++$i) {
      $w = mysqli_fetch_assoc($r);
      echo "<option value='$w[il_text]'></option>";
    }
    echo "</datalist>";
    echo "</div>";
    echo "<div class='col-sm-2 text-right'>";
    echo "<button type=submit name=submit class=\"btn btn-primary\">Save</button>";
    echo "</div>";
    echo "</div>";
    echo "</form>";
  } else {
    echo "<form action=store.php method=post>";
    echo "<div class='form-group row'>";
    echo "<label class='col-sm-2 col-form-label'>Type:</label>";
    echo "<div class=col-sm-10>";
    echo "<input class='form-control' name=f_type value='" . get_typename($wf['f_type']) . "' readonly>";
    echo "</div></div>";

    echo "<div class='form-group row'>";
    echo "<label class='col-sm-2 col-form-label'>Visibility:</label>";
    echo "<div class=col-sm-10>";
    echo "<input class='form-control' name=f_private value='";
    if ($wf['f_private']) echo "private";
    else echo "public";
    echo "' readonly>";
    echo "</div></div>";

    echo "<div class='form-group row'>";
    echo "<label class='col-sm-2 col-form-label'>Instruments:</label>";
    echo "<div class=col-sm-10>";
    echo "<input class='form-control' name=f_instruments value='$wf[f_instruments]' readonly>";
    echo "</div></div>";
    echo "</form>";
  }
  echo "</p>";
  echo "<form action=store.php method=post>";
  echo "<div class='form-group row'>";
  echo "<label class='col-sm-2 col-form-label'>Upload time:</label>";
  echo "<div class=col-sm-10>";
  echo "<input class='form-control' name=f_time value='$wf[f_time]' readonly>";
  echo "</div></div>";
  echo "</form>";
}

function show_jobs($f_id) {
  GLOBAL $ml, $ftypes2, $jclasses;
  echo "<table class='table'>"; // table-striped table-hover
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>State</th>";
  echo "<th scope=col style='text-align: center;'>Type</th>";
  echo "<th scope=col style='text-align: center;'>Class</th>";
  echo "<th scope=col style='text-align: center;'>Result</th>";
  echo "<th scope=col style='text-align: center;'>Job created</th>";
  echo "<th scope=col style='text-align: center;'>Job started</th>";
  echo "<th scope=col style='text-align: center;'>Duration (s)</th>";
  echo "</tr>\n";
  echo "</thead>";
  echo "<tbody>";
  if ($f_id) $cond = " AND f_id='$f_id'";
  else $cond = " AND f_private=0";
  $r = mysqli_query($ml, "SELECT * FROM jobs
    LEFT JOIN files USING (f_id) 
    LEFT JOIN users USING (u_id)
    WHERE 1=1 $cond 
    ORDER BY j_deleted, j_added DESC, j_class
    LIMIT 100");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    echo "<tr>";
    $class = "";
    if ($w['j_deleted']) $class = "class=table-secondary";
    echo "<td $class align=center>";
    echo show_job($w, $w['j_class'], 1);
    echo "<td $class align='center'>".$ftypes2[$w['j_type']]."</td>";
    echo "<td $class align='center'>".$jclasses[$w['j_class']]."</td>";
    echo "<td $class align=center>";
    echo show_job($w, $w['j_class'], 2);
    echo "<td $class align='center'><a href='job.php?j_id=$w[j_id]'>$w[j_added]</td>";
    echo "<td $class align='center'>";
    if ($w['j_started'] + 0) echo "$w[j_started]</td>";
    else echo "-";
    echo "<td $class align='center'>";
    if ($w['j_duration']) echo "$w[j_duration]";
    else echo "-";
    echo "</tr>\n";
  }
  echo "</tbody>";
  echo "</table>";
}

?>
