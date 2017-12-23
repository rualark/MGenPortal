<?
require_once "lib/config.php";
require_once "lib/lib.php";

insert_analytics_hit('hits_b', $_GET['hitserver'], $_GET['hitscript'], $_GET['hitquery'], $_GET['u_id']);
?>