<div class="col-md-4" style="margin: 0 auto;">
  <form action=pass_reset.php method=post>
    <br>
    <h4>Reset your password</h4>
    <?php
    echo "<br><p class=text-danger><b>$auth_error</b></p>";
    ?>
    <div class="form-group">
      <label for="login"><b>Enter your email address and we will send you a link to reset your password</b></label>
      <input type="email" class="form-control" id="login" name=login placeholder="Enter email" required>
    </div>
    <button type=submit value=reset name=reset class="btn btn-primary">Send password reset email</button>
  </form>
</div>