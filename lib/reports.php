<?php

require_once "layout.php";

function get_job_queue_place($wj) {
  GLOBAL $ml;
  $r = mysqli_query($ml, "SELECT COUNT(*) as cnt FROM jobs 
      WHERE (j_state=1 OR j_state=2) AND j_deleted=0 AND 
      (j_priority < '$wj[j_priority]' OR j_id < '$wj[j_id]')");
  echo mysqli_error($ml);
  $w = mysqli_fetch_assoc($r);
  return $w['cnt'];
}

function get_job_queue_wait($wj) {
  GLOBAL $ml;
  $r = mysqli_query($ml, "SELECT TIMESTAMPDIFF(SECOND, j_queued, NOW()) as pass 
    FROM jobs WHERE j_id='$wj[j_id]'");
  echo mysqli_error($ml);
  $w = mysqli_fetch_assoc($r);
  return $w['pass'];
}

function show_job_icon($w, $c, $t=0) {
  GLOBAL $bheight;
  if (!$w['j_id']) return "-";
  if ($t == 0) {
    if ($w['j_deleted'] && $w['j_state'] < 3)
      return "<a title='This job was deleted and did not finish' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/delete.png>";
    if ($w['j_state'] == 0)
      return "<a title='Need to manually start this job' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/draft.png>";
    if ($w['j_state'] == 1)
      return "<a title='Will run after ".get_job_queue_place($w)." jobs\nWaiting in queue for ".
        human_pass(get_job_queue_wait($w))." already' href='job.php?j_id=$w[j_id]'><b>Queued...</b>";
    if ($w['j_state'] == 2)
      return "<a title='$w[j_progress]' href='job.php?j_id=$w[j_id]'><b>Running...</b>";
    if ($w['j_state'] == 3 && $w['j_result'])
      return "<a title='$w[j_progress]' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/stop.png>";
    if ($c == 2)
      return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".mp3'><img height=$bheight src='img/mp3.png'></a>";
    else return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".pdf'><img height=$bheight src='img/pdf.png'></a>";
  }
  if ($t == 1) {
    if ($w['j_deleted'] && $w['j_state'] < 3)
      return "<a title='This job was deleted and did not finish' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/delete.png>";
    if ($w['j_state'] == 0)
      return "<a title='Need to manually start this job' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/draft.png>";
    if ($w['j_state'] == 1)
      return "<a title='Will run after ".get_job_queue_place($w)." jobs\nWaiting in queue for ".
        human_pass(get_job_queue_wait($w))." already' href='job.php?j_id=$w[j_id]'><b>Queued...</b>";
    if ($w['j_state'] == 2)
      return "<a title='$w[j_progress]' href='job.php?j_id=$w[j_id]'><b>Running...</b>";
    if ($w['j_state'] == 3 && $w['j_result'])
      return "<a title='$w[j_progress]' href='job.php?j_id=$w[j_id]'><img height=$bheight src=img/stop.png>";
    return "<a title='Job completed OK' href='job.php?j_id=$w[j_id]'><img height=$bheight src='img/ok.png'>";
  }
  if ($t == 2) {
    if ($w['j_state'] < 3 || $w['j_result']) return "-";
    if ($c == 2)
      return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".mp3'><b>MP3</b></a>";
    else return "<a target=_blank title='Job completed' href='share/" . bjurl($w) . ".pdf'><b>PDF</b></a>";
  }
  return "-";
}

function show_uploads() {
  GLOBAL $ml, $uid, $ftypes2, $wj;
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
    echo "<td align='center'>$w[f_time]</td>";
    echo "<td align='center'>$w[u_name]</td>";
    echo "<td align='center'><a href='file.php?f_id=$w[f_id]'>$w[f_name]</td>";
    echo "<td align='center'>".$ftypes2[$w['f_type']]."</td>";
    $r2 = mysqli_query($ml, "SELECT * FROM jobs WHERE f_id='$w[f_id]' ORDER BY j_added");
    echo mysqli_error($ml);
    $n2 = mysqli_num_rows($r2);
    $wa = array();
    for ($x=0; $x<$n2; ++$x) {
      $wj = mysqli_fetch_assoc($r2);
      $wa[$wj['j_class']] = $wj;
      $wa[$wj['j_class']]['f_name'] = $w['f_name'];
    }
    echo "<td align=center>";
    echo show_job_icon($wa[0], 0);
    echo "<td align=center>";
    echo show_job_icon($wa[1], 1);
    echo "<td align=center>";
    echo show_job_icon($wa[2], 2);
    echo "</tr>\n";
  }
  echo "</tbody>";
  echo "</table>";
}

function show_upload() {
  GLOBAL $uid, $f_id, $wf, $ftypes, $vtypes, $bheight, $MAX_INSTR, $caa;
  echo "<div class=container>";
  echo "<br><h2 align=center><a href='share/$wf[f_folder]$wf[f_name]'><img src='img/midi.png' height='$bheight'></a> $wf[f_name] uploaded by $wf[u_name]</h2>";
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
    echo "<input type=hidden name=action value=ilist_size>";
    echo "<div class='form-group row'>";
    echo "<label for=ilist_size class='col-sm-2 col-form-label'>Voices:</label>";
    echo "<div class=col-sm-10>";
    echo "<select class=\"custom-select\" id=ilist_size name=ilist_size onChange='this.form.submit();'>";
    $ia = explode(",", $caa[2]['instruments']);
    for ($i=1; $i<$MAX_INSTR; ++$i) {
      echo "<option value=$i";
      if ($i == count($ia)) echo " selected";
      echo ">$i</option>";
    }
    echo "</select>";
    echo "</div></div>";
    echo "</form>";

    echo "<form action=store.php method=post>";
    echo "<input type=hidden name=f_id value='$f_id'>";
    echo "<input type=hidden name=action value=f_instruments>";
    echo "<div class='form-group row'>";
    echo "<label for=f_instruments class='col-sm-2 col-form-label'>Instruments:</label>";
    echo "<div class=col-sm-10>";
    show_iselects($caa[2]['instruments']);
    echo "<button type=submit name=submit class=\"btn btn-primary\">Save</button>";
    echo "</div></div>";
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
    echo "<input class='form-control' name=f_instruments value='".$caa[2]['instruments']."' readonly>";
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

function show_jobs($f_id, $j_id=0) {
  GLOBAL $ml, $ftypes2, $jclasses, $wj;
  echo "<table class='table'>"; // table-striped table-hover
  echo "<thead>";
  echo "<tr>";
  echo "<th scope=col style='text-align: center;'>State</th>";
  echo "<th scope=col style='text-align: center;'>Type</th>";
  echo "<th scope=col style='text-align: center;'>Job</th>";
  echo "<th scope=col style='text-align: center;'>Result</th>";
  echo "<th scope=col style='text-align: center;'>Job created</th>";
  echo "</tr>\n";
  echo "</thead>";
  echo "<tbody>";
  if ($f_id) $cond = " AND f_id='$f_id'";
  else if ($j_id) $cond = " AND j_id='$j_id'";
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
    $wj = mysqli_fetch_assoc($r);
    echo "<tr>";
    $class = "";
    if ($wj['j_deleted']) $class = "class=table-secondary";
    echo "<td $class align=center><div id='js$wj[j_id]'>";
    echo show_job_icon($wj, $wj['j_class'], 1);
    echo "</div>";
    echo "<td $class align='center'>".$ftypes2[$wj['j_type']]."</td>";
    echo "<td $class align='center'>".$jclasses[$wj['j_class']]."</td>";
    echo "<td $class align=center><div id='jr$wj[j_id]'>";
    echo show_job_icon($wj, $wj['j_class'], 2);
    echo "</div>";
    echo "<td $class align='center' title='$wj[j_cause]'>$wj[j_added]</td>";
    echo "</tr>\n";
  }
  echo "</tbody>";
  echo "</table>";
}

function show_status($s_id = 0) {
  GLOBAL $ml, $bheight2;
  echo "<div class=container>";
  // Show servers
  if ($s_id) echo "<br><h2 align=center>Processing server #$s_id</h2><br>";
  else echo "<br><h2>Processing servers:</h2><br>"; //  align=center
  echo "<div class=row>";
  $cond = "";
  if ($s_id) $cond = " WHERE s_id='$s_id'";
  $r = mysqli_query($ml, "SELECT *, 
    TIMESTAMPDIFF(SECOND, last_update, NOW()) as pass 
    FROM s_status
    $cond
    ORDER BY pass>5, server_age DESC");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    if ($s_id) {
      echo "<div class=col-sm-8 style='margin: 0 auto;'>";
      echo "<a href='share/screen$w[s_id]-$w[screenshot_id].png' target=_blank>";
    }
    else {
      echo "<div class=col-sm-4>";
      echo "<a href='status.php?s_id=$w[s_id]'>";
    }
    echo "<img src='share/screen$w[s_id]-$w[screenshot_id].png' title='";
    echo get_last_server_log($w['s_id']) . "\n";
    if ($w['pass'] < 5) echo human_pass($w['os_age'])." since OS restart";
    echo "' class='img-fluid img-thumbnail'></a>";
    if ($s_id) {
      echo "<div class=row>";
      for ($x=1; $x<9; $x++) {
        $scr_id = ($w['screenshot_id'] + 10 - $x) % 10;
        echo "<div class=col-sm-1>";
        echo "<a title='$x seconds ago' href='share/screen$w[s_id]-$scr_id.png' target=_blank><img class='img-fluid' src='share/screen$w[s_id]-$scr_id.png'></a>";
        echo "</div>";
      }
      echo "</div>";
    }
    echo "<br>";
    echo "<a href='status.php?s_id=$w[s_id]'>#$w[s_id]: $w[s_host]</a>";
    if ($w['pass'] < 5) {
      if ($w['j_id']) echo "<br>Job running: <a href='job.php?j_id=$w[j_id]'>#$w[j_id]</a>";
      echo "<p title='Last update $w[pass] seconds ago' class=text-success><b>Online for ".human_pass($w['server_age'])."</b></p>";
      if ($w['reaper_age'] > 0) echo "<img title='Reaper online for ".human_pass($w['reaper_age'])."' src='img/reaper.png' height=$bheight2> ";
      else echo "<img title='Reaper offline' src='img/reaper_gray.png' height=$bheight2> ";
      if ($w['ahk_age'] > 0) echo "<img title='AutoHotkey online for ".human_pass($w['ahk_age'])."' src='img/ahk.png' height=$bheight2> ";
      else echo "<img title='AutoHotkey offline' src='img/ahk_gray.png' height=$bheight2> ";
      if ($w['mgen_age'] > 0) echo "<img title='MGen online for ".human_pass($w['mgen_age'])."' src='img/mgen.png' height=$bheight2> ";
      else echo "<img title='MGen offline' src='img/mgen_gray.png' height=$bheight2> ";
      if ($w['ly_age'] > 0) echo "<img title='Lilypond online for ".human_pass($w['ly_age'])."' src='img/ly.png' height=$bheight2> ";
      else echo "<img title='Lilypond offline' src='img/ly_gray.png' height=$bheight2> ";
    }
    else echo "<p title='Was online $w[last_update]' class=text-danger><b>Offline for ".human_pass($w['pass'])."</b></p>";
    echo "</div>";
  }
  echo "</div>";
  if ($s_id) {
    show_server_logs($s_id);
  }
  $r = mysqli_query($ml, "SELECT COUNT(*) as cnt FROM jobs WHERE j_state=1 AND j_deleted=0");
  echo mysqli_error($ml);
  $w = mysqli_fetch_assoc($r);
  echo "<br><hr>";
  echo "<p class='lead'><img src='img/pause.png' height='$bheight2'> Jobs waiting in queue: $w[cnt]</p>"; //  align=center

  $r = mysqli_query($ml, "SELECT COUNT(*) as cnt FROM jobs WHERE j_state=2 AND j_deleted=0");
  echo mysqli_error($ml);
  $w = mysqli_fetch_assoc($r);
  echo "<p class='lead'><img src='img/play.png' height='$bheight2'> Jobs running: $w[cnt]</p>"; //  align=center
}

function show_server_logs($s_id) {
  GLOBAL $ml;
  $r = mysqli_query($ml, "SELECT * FROM j_logs WHERE s_id='$s_id'
    ORDER BY l_id DESC LIMIT 100");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  if ($n) {
    echo "<hr><h3>Server logs:</h3>";
    echo "<pre>";
    for ($i=0; $i<$n; ++$i) {
      $w = mysqli_fetch_assoc($r);
      if ($w['j_id']) echo "<a href='job.php?j_id=$w[j_id]'>";
      echo "$w[l_time] $w[l_text]</a>\n";
    }
    echo "</pre>";
  }
}

function show_job() {
  GLOBAL $j_id, $wj, $ml, $uid;
  echo "<h2 align=center>Job #$j_id for file <a href='file.php?f_id=$wj[f_id]'>$wj[f_name]</a></h2>";
  show_jobs(0, $j_id);
  echo "<hr>";
  //echo "<p><b>Job type:</b> ".$ftypes[$wj['j_type']]." / ".$jclasses[$wj['j_class']]."</p>";
  if ($wj['u_id'] != $uid) {
    echo  "<p style='color:lightgray' align='right'>Cannot start - this file belongs to other user</p>";
  }
  else if ($wj['j_deleted']) {
    echo  "<p style='color:lightgray' align='right'>Cannot start - this job is deleted</p>";
  }
  else {
    if ($wj['j_state'] == 0)
      echo " <p align='right'><a class=\"btn btn-success\" href='store.php?action=startjob&j_id=$j_id' role=\"button\">
        Start job</a><br>";
    else if ($wj['j_state'] == 3)
      echo " <p align='right'><a class=\"btn btn-success\" href='store.php?action=startjob&j_id=$j_id' role=\"button\">
        Restart job</a><br>";
    else
      echo  "<p style='color:lightgray' align='right'>Cannot restart - this job has not finished yet</p>";
  }
  echo "<p><b>Started:</b> ";
  if ($wj['j_started'] + 0) echo "$wj[j_started]";
  else echo "-";
  echo "<p><b>Run duration :</b> ";
  if ($wj['j_duration'] + 0) echo "$wj[j_duration] seconds";
  else echo "-";
  echo "<p><b>Timeouts:</b> MGen soft $wj[j_timeout], MGen hard $wj[j_timeout2], Lilypond $wj[j_engrave], Reaper $wj[j_render]</p>";
  echo "<p><b>Processing server:</b> ";
  if ($wj['s_id']) echo "<a href='status.php?s_id=$wj[s_id]'>#$wj[s_id]</a>";
  echo "<p><b>Priority:</b> $wj[j_priority] ";
  echo "<p><b>Progress:</b> <span id='jp$wj[j_id]'>$wj[j_progress]</span></p>";
  if ($wj['j_state'] == 2) {
    $r = mysqli_query($ml, "SELECT *, 
      TIMESTAMPDIFF(SECOND, last_update, NOW()) as pass 
      FROM s_status
      WHERE s_id='$wj[s_id]'");
    echo mysqli_error($ml);
    $w = mysqli_fetch_assoc($r);
    if ($w['pass'] < 5) {
      echo "<div id='jsc$j_id' class=col-sm-6>";
      echo "<a href='share/screen$w[s_id]-$w[screenshot_id].png' target=_blank><img src='share/screen$w[s_id]-$w[screenshot_id].png'";
      echo " class='img-fluid img-thumbnail'></a>";
      echo "</div><br>";
    }
  }
  echo "<p><a class=\"btn btn-outline-primary\" target=_blank href='share/$wj[f_folder]/$wj[f_name]'>Initial file</a> ";
  echo "<a class=\"btn btn-outline-primary\" target=_blank href='share/$wj[j_folder]'>Browse config, results and logs (job folder)</a>";
  $r = mysqli_query($ml, "SELECT * FROM j_logs WHERE j_id='$j_id'
    ORDER BY l_id DESC LIMIT 100");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  if ($n) {
    echo "<hr><h3>Job logs:</h3>";
    echo "<pre>";
    for ($i=0; $i<$n; ++$i) {
      $w = mysqli_fetch_assoc($r);
      echo "$w[l_time] $w[l_text]\n";
    }
    echo "</pre>";
  }
  if (file_exists("share/$wj[j_folder]log-warning.log")) {
    echo "<hr><h3>MGen warning log:</h3>";
    echo "<pre>";
    echo file_get_contents("share/$wj[j_folder]log-warning.log");
    echo "</pre>";
  }
}

function show_job_editor() {
  GLOBAL $jconfig, $j_id, $cm_theme, $wj, $uid;
  if ($wj['j_deleted'] == 0 && $wj['u_id'] == $uid) {
    $cm_theme = "material";
    $cm_readonly = "false";
  }
  else {
    $cm_theme = "duotone-light";
    $cm_readonly = "true";
  }
  echo "<link rel='stylesheet' type='text/css' href='plugin/codemirror/lib/codemirror.css'>";
  echo "<link rel='stylesheet' type='text/css' href='plugin/codemirror/theme/$cm_theme.css'>";
  echo "<link rel='stylesheet' type='text/css' href='plugin/codemirror/addon/dialog/dialog.css'>";
  echo "<link rel='stylesheet' type='text/css' href='plugin/codemirror/addon/search/matchesonscrollbar.css'>";
  echo "<link rel='stylesheet' type='text/css' href='plugin/codemirror/addon/display/fullscreen.css'>";

  echo "<hr><h3>Job config:</h3>";
  echo "<form id='preview-form' method='post' action='store.php'>";
  echo "<input type=hidden name=action value=jconfig>";
  echo "<input type=hidden name=j_id value='$j_id'>";
  echo "<textarea class='codemirror-textarea' name='jconfig' id='jconfig'>";
  echo $jconfig;
  echo "</textarea>";
  echo "<br>";
  if ($wj['u_id'] != $uid) {
    echo "<p class='text-danger'>You cannot change config because this file belongs to other user.</p>";
  }
  else if ($wj['j_deleted'] == 0) {
    echo "<button type=submit value=submit name=submit class='btn btn-primary'>Save config</button> ";
    echo " <a target='_blank' class=\"btn btn-outline-primary\" href=\"https://github.com/rualark/MGenPortal/wiki/Editing-job-configuration#user-content-job-config-editor-keyboard-shortcuts\" role=\"button\">
    Keyboard shortcuts</a>";
  }
  else {
    echo "<p class='text-danger'>You cannot change config because this job is deleted. Edit config of active job for this <a href=file.php?f_id=$wj[f_id]>file</a>.</p>";
  }
  echo " <a target='_blank' class=\"btn btn-outline-primary\" href='share/MGen/configs' role=\"button\">
    Example and include configs</a>";
  echo " <a target='_blank' class=\"btn btn-outline-primary\" href='share/MGen/instruments' role=\"button\">
    Instrument configs</a>";
  echo "</form>";

  echo "<script src=\"js/jquery.min.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/lib/codemirror.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/addon/dialog/dialog.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/addon/search/search.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/addon/search/searchcursor.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/addon/search/matchesonscrollbar.js\"></script>
  <script type=\"text/javascript\" src=\"plugin/codemirror/addon/display/fullscreen.js\"></script>
  <script src=\"plugin/codemirror/mode/perl/perl.js\"></script>
  <script>
    $(document).ready(function(){
      var code = $(\".codemirror-textarea\")[0];
      var editor = CodeMirror.fromTextArea(code, {
        lineNumbers : false,
        matchBrackets: true,
        mode: 'perl',
        styleActiveLine: true,
        indentUnit: 2,
        readOnly: $cm_readonly,
        theme: '$cm_theme',
        extraKeys: {
          \"Alt-F\": \"findPersistent\",
          \"F11\": function(cm) {
            cm.setOption(\"fullScreen\", !cm.getOption(\"fullScreen\"));
          },
          \"Esc\": function(cm) {
            if (cm.getOption(\"fullScreen\")) cm.setOption(\"fullScreen\", false);
          }
        }
      });
      editor.display.wrapper.style.fontSize = \"16px\";
      editor.setSize(\"100%\", 500);
    });
  </script>";
}

function show_iselect($id, $name) {
  GLOBAL $ml;
  $r = mysqli_query($ml, "SELECT * FROM instr");
  echo mysqli_error($ml);
  $n = mysqli_num_rows($r);
  echo "<select class=\"custom-select\" id='isel$id' name='isel$id'>";
  for ($i=0; $i<$n; ++$i) {
    $w = mysqli_fetch_assoc($r);
    echo "<option value=$w[i_name]";
    if ($w['i_name'] == $name) echo " selected";
    echo ">$w[i_name]</option>";
  }
  echo "</select> ";
}

function show_iselects($ilist) {
  if ($ilist != "") {
    $ia = explode(",", $ilist);
    $id = 0;
    foreach($ia as $key => $val) {
      $val = trim($val);
      show_iselect($id, $val);
      ++$id;
    }
  }
}
?>