<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "$site_name: Job";
$j_id = secure_variable("j_id");

login();

include "template/menu.php";

echo "<br>";
echo "<div class=container>";

load_job();
load_job_config();

show_job();
show_job_editor();

include "template/footer.php";
?>