<?php

//initially
$comment = null;

//if the form is submitted
if($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['preview-form-comment'])) {
	$comment = $_POST['preview-form-comment'];
}

?>

<!DOCTYPE html>
<html>
	<head>
		<title>CodeMirror - Form</title>
		<link rel="stylesheet" type="text/css" href="plugin/codemirror/lib/codemirror.css">
	</head>
	<body>
		<form id="preview-form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
			<textarea class="codemirror-textarea" name="preview-form-comment" id="preview-form-comment"><?php echo $comment; ?></textarea>
			<br>
			<input type="submit" name="preview-form-submit" id="preview-form-submit" value="Submit">
		</form>
		<div id="preview-comment"><?php echo $comment; ?></div>

		<!-- javascript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="plugin/codemirror/lib/codemirror.js"></script>
	</body>
</html>
<script>
$(document).ready(function(){
	//code here...
	var code = $(".codemirror-textarea")[0];
	var editor = CodeMirror.fromTextArea(code, {
		lineNumbers : true
	});

	//when form submitted
	$("#preview-form").submit(function(e){
		var value = editor.getValue();
		if(value.length == 0) {
			alert("Missing comment!");
		}
	});
});
</script>