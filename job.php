<?php
require_once "lib/mlib.php";
require_once "lib/config.php";
require_once "lib/auth.php";
require_once "lib/reports.php";

$title = "$site_name: Job";
$j_id = secure_variable("j_id");

login();
load_job();
load_job_config();

include "template/menu.php";
echo "<br>";
echo "<div class=container>";

$cm_theme = "material";
show_job();
show_job_editor();

include "template/footer.php";
?>

<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/codemirror/lib/codemirror.js"></script>
<script type="text/javascript" src="plugin/codemirror/addon/dialog/dialog.js"></script>
<script type="text/javascript" src="plugin/codemirror/addon/search/search.js"></script>
<script type="text/javascript" src="plugin/codemirror/addon/search/searchcursor.js"></script>
<script type="text/javascript" src="plugin/codemirror/addon/search/matchesonscrollbar.js"></script>
<script type="text/javascript" src="plugin/codemirror/addon/display/fullscreen.js"></script>
<script src="plugin/codemirror/mode/perl/perl.js"></script>
<script>
    $(document).ready(function(){
        //code here...
        var code = $(".codemirror-textarea")[0];
        var editor = CodeMirror.fromTextArea(code, {
            lineNumbers : false,
            matchBrackets: true,
            mode: 'perl',
            styleActiveLine: true,
            indentUnit: 2,
            theme: '<?=$cm_theme ?>',
            extraKeys: {
                "Alt-F": "findPersistent",
                "F11": function(cm) {
                    cm.setOption("fullScreen", !cm.getOption("fullScreen"));
                },
                "Esc": function(cm) {
                    if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
                }
            }
        });
        editor.display.wrapper.style.fontSize = "16px";
        editor.setSize("100%", 500);

        //when form submitted
        $("#preview-form").submit(function(e){
            var value = editor.getValue();
            if(value.length == 0) {
                alert("Missing comment!");
            }
        });
    });
</script>