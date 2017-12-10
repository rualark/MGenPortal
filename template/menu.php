<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="img/favicon.ico">

  <title><?=$title ?></title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="css/mgen.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.php"><b>Composer Tracker</b></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <?php
        if ($uid) {
          ?>
          <li class=nav-item><a class=nav-link href="new.php"><b>Upload</b></a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Music</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="uploads.php">Uploads</a>
              <a class="dropdown-item" href="passages.php">Passages</a>
            </div>
          </li>
          <li class=nav-item><a class=nav-link href="status.php">Status</a></li>
          <li class=nav-item><a class=nav-link href="explore.php">Explore</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <?=$ua['u_name'] ?></a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="profile.php">Profile</a>
              <a class="dropdown-item" href="login.php?action=out">Sign out</a>
            </div>
          </li>
          <?php
        }
        else {
          ?>
          <li class=nav-item><a class=nav-link href="login.php"><b>Login</b></a></li>
          <li class=nav-item><a class=nav-link href="reg.php"><b>Sign up</b></a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Music</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="uploads.php">Uploads</a>
              <a class="dropdown-item" href="passages.php">Passages</a>
            </div>
          </li>
          <?php
        }
        ?>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-brown my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
