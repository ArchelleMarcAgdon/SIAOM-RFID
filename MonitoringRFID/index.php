<!DOCTYPE html>
<html lang="eng">
	<head>
		<meta charset="utf-8"/>
		<title>Student In and Out Monitoring with RFID</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	</head>
	<body class="alert-info" onload="setInterval('refreshPage()', 2000)">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<img src="Pictures/perps-logo.png" width="35px" height="45px"/>
					<p class="navbar-text pull-right">Student In and Out Monitoring with RFID</p>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<br />
			<br />
			<br />
			<br />
			<br />
			<center><img src="Pictures/Homelogo.png" width="285px" height="150px"/></center>
			<br />
			<br />
			<div class="col-lg-3"></div>
			<div class="col-lg-6 well">
				<h2>Attendance Login</h2>
				<br />
				<div id="result"></div>
				<br />
				<br />
				<form enctype="multipart/form-data">
					<div class="form-group">
						<label>Student ID:</label>
						<input type="text" id="student" class="form-control" required="required" autofocus onblur="keepFocus()"/>
						<br />
						<br />
						<div id="error"></div>
						<br />		
						<button type="button" id="login" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-login"></span>LogIn</button>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/tlogin.js"></script>
	<script>
		function keepFocus() {
			document.getElementById("student").focus();
		}

		function refreshPage() {
			location.reload(true);
		}
	</script>
</html>
