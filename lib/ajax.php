<?php
function periodic_update($url, $ms) {
?>

  <script>
  function update_element(element) {
    var d = element.split('|');
    var div = document.getElementById(d[0]);
    if (div !== null) div.innerHTML = d[1];
  }

  (function periodic_update() {
    $.ajax({
      url: '<?=$url ?>',
      success: function(data) {
        data2 = data.split('^');
        if (data2.length>0) {
          data2.forEach(update_element);
        }
      },
      complete: function() {
        // Schedule the next request when the current one is complete
        setTimeout(periodic_update, <?=$ms ?>);
      }
    });
  })();
</script>

  <?php
}
?>
