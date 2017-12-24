<main role="main">
  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron jumbotron-fluid jumbotron1">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: white' align=center>Analyse and render your music</h1>
          <p style='color: white' class=lead align="center">Here you can upload your MIDI files, receive music score analysis, suggested corrections and render your music to MP3 with most realistic virtual instruments available.</p>
          <?php
          if (!$uid) {
            ?>
            <p style='color: white' align="center">
              <a class="btn btn-danger btn-lg" href="login.php" role="button">Login</a>
              or
              <a class="btn btn-danger btn-lg" href="reg.php" role="button">Sign up</a>
            </p>
            <?php
          }
          ?>
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div style="margin: 0 auto;">
          <?php
          share_link("$url_share",
            "$site_name",
            "Analyze, correct and perform your music with professional-grade virtual instruments",
            "$url_share/img/ctracker_600.png");
          echo "<br><br>";
          ?>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>Get MP3 performance of your music piece</h1>
          <p style='color: black' class=lead align="center">Instrument Adaptation system can automatically perform of your MIDI file with professional-grade virtual instruments.
            Just upload your MIDI file and choose instruments to use.
            Tweak parameters to get better results.
            You can even get multitrack performance with each instrument solo in separate file.
            Currently supports solo Violin, Trumpet, Trombone, Tuba, Piano instruments.
            Listen to examples of automatic performance:</p>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <iframe class='embed-responsive' style="margin: 0 auto; display:block;" width="560" height="315" src="https://www.youtube.com/embed/91ePSlmW-gQ" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <iframe class='embed-responsive' style="margin: 0 auto; display:block;" width="560" height="315" src="https://www.youtube.com/embed/mLNadlwiDas" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>Find mistakes in your counterpoint exercises</h1>
          <p style='color: black' class=lead align="center">Upload your counterpoint exercises and let the system show violations of counterpoint rules with detailed descriptions
            .
            Do not wait until your professor has time to reply.
            Currently supports analysis of 2 voice species 1-5 counterpoint and cantus firmus.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <img class="img-fluid mx-auto d-block" src="img/analysis.png">
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>Automatically correct mistakes in your exercises</h1>
          <p style='color: black' class=lead align="center">System will show you best way to correct mistakes in your counterpoint exercises.
            Fast (10 seconds per counterpoint) and more accurate (1-10 minutes) modes are available if you have more time.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <img class="img-fluid mx-auto d-block" src="img/correct.png">
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>Run harmonic analysis</h1>
          <p style='color: black' class=lead align="center">Get harmonic analysis of your 2-voice counterpoint.
            Different harmonic notations are available, from international to Sposobin.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <img class="img-fluid mx-auto d-block" src="img/harm.png">
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>Ensure your privacy</h1>
          <p style='color: black' class=lead align="center">
            When uploading your music, mark it private so that other site users will not see it listed in the table of uploaded files.
          </p>
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron jumbotron-fluid jumbotron2">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="margin: 0 auto;">
          <h1 style='color: black' align=center>How it works</h1>
          <p style='color: black' class=lead align="center">We use Digital audio workstation and virtual instruments installed on virtual machines to perform your music.
            You do not need to install and use these applications on your Mac or PC, or ask your sound engineer to render a performance.
            This is done by our robots:
          </p>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="col-md-12" style="margin: 0 auto;">
          <img class="img-fluid mx-auto d-block" src="img/scheme.png">
        </div>
      </div>
    </div>
  </div>

  <br>

</main>
