<?
  insert_analytics_hit('hits', $_SERVER['HTTP_HOST'],
    $_SERVER['SCRIPT_NAME'], $_SERVER['QUERY_STRING'], $uid);
?>
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56489282-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)}
  gtag('js', new Date());

  gtag('config', 'UA-56489282-1');

  function httpGetAsync(theUrl, callback) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
      if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
        callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous
    xmlHttp.send(null);
  }
  <?
echo "httpGetAsync('$url_main/hit.php?u_id=$uid&hitserver=$_SERVER[HTTP_HOST]&hitscript=$_SERVER[SCRIPT_NAME]&hitquery=$_SERVER[QUERY_STRING]');";
?>
</script>
