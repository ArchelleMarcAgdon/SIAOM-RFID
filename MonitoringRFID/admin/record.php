<!DOCTYPE html>
<?php
	require_once 'validator.php';
	require_once 'account.php'; 
?>
<html lang = "eng">
	<head>
		<title>Student In and Out Monitoring with RFID</title>
		<meta charset = "utf-8" />
		<meta name = "viewport" content = "width=device-width, initial-scale=1" />
		<link rel = "stylesheet" href = "css/bootstrap.css" />
		<link rel = "stylesheet" href = "css/jquery.dataTables.css" />
		<link rel="stylesheet" type="text/css" href="css/print.css" media="print">

	</head>
	<body>
		<nav class = "navbar navbar-inverse navbar-fixed-top">
			<div class = "container-fluid">
				<div class = "navbar-header">
					<img src = "../Pictures/perps-logo.png" width = "35px" height = "45px"/>
					<p class = "navbar-text pull-right">Student In and Out Monitoring with RFID</p>
				</div>
				<ul class = "nav navbar-nav navbar-right">
					<li class = "dropdown">
						<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown"><i class = "glyphicon glyphicon-user"></i> <?php echo htmlentities($admin_name)?> <b class = "caret"></b></a>
						<ul class = "dropdown-menu">
							<li><a href = "logout.php"><i class = "glyphicon glyphicon-off"></i> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		<div class = "container-fluid" style = "margin-top:70px;">
			<ul class = "nav nav-pills">
				<li><a href = "home.php"><span class = "glyphicon glyphicon-home"></span> Home</a></li>
				<li class = "dropdown">
					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#"><span class = "glyphicon glyphicon-cog"></span> Accounts <span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "admin.php"><span class = "glyphicon glyphicon-user"></span> Admin</a></li>
						<li><a href = "student.php"><span class = "glyphicon glyphicon-user"></span> Student</a></li>
						<li><a href = "course.php"><span class = "glyphicon glyphicon-book"></span> Course</a></li>
					</ul>
				</li>
				<li class = "active"><a href = "record.php"><span class = "glyphicon glyphicon-book"></span> Logs</a></li>
			</ul>
			<br />
			<div class = "alert alert-info">Record</div>
			<div class = "modal fade" id = "delete" tabindex = "-1" role = "dialog" aria-labelledby = "myModallabel">
			</div>
			<div class = "well col-lg-12">
				
				<table id = "table" class = "table table-bordered">

			<div class="form-group">
			<label for="course">Course:</label>
			<select id="course" name="course" class="form-control">
				<option value="">-- Select Course --</option>
				<?php
					// Query to retrieve all distinct course codes from the course table
					$q_courses = "SELECT DISTINCT coursecode FROM course";
					$result = mysqli_query($conn, $q_courses);

					if (mysqli_num_rows($result) > 0) {
						while ($course = mysqli_fetch_assoc($result)) {
							echo '<option value="' . $course['coursecode'] . '">' . $course['coursecode'] . '</option>';
						}
					} else {
						echo '<option value="">No courses found</option>';
					}
				?>
			</select>
			</div>

			<div class="card-body">
    <form action="" method="GET">
        <div class="row">
		<div class="col-md-4">
		<div class="form-group">
			<label for="start_time">Start Time:</label>
			<input type="time" id="start_time" name="start_time" value="<?php if(isset($_GET['start_time'])){ echo htmlentities($_GET['start_time']); } ?>" class="form-control">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label for="end_time">End Time:</label>
				<input type="time" id="end_time" name="end_time" value="<?php if(isset($_GET['end_time'])){ echo htmlentities($_GET['end_time']); } ?>" class="form-control">
			</div>
		</div>

            <div class="col-md-4">
                <div class="form-group">
                    <label for="from_date">From Date:</label>
                    <input type="date" id="from_date" name="from_date" value="<?php if(isset($_GET['from_date'])){ echo htmlentities($_GET['from_date']); } ?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="to_date">To Date:</label>
                    <input type="date" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo htmlentities($_GET['to_date']); } ?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>&nbsp;</label> <br>
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <button type="button" class="btn btn-secondary" onclick="window.location.href = 'record.php';">Reset</button>
                </div>

            </div>
        </div>
    </form>
</div>
				<br>
				<br>


				<div>
					<button type="button" class="btn btn-success" onclick="printData()">Print</button>
				</div>
				<br>
				<br>
<thead class="alert-info">
	<tr>
		<th>Student ID</th>
		<th>Student Name</th>
		<th>In Time</th>
		<th>Out Time</th>
		<th>Date</th>
	</tr>
</thead>
<tbody>

<?php
if (isset($_GET['from_date']) && isset($_GET['to_date'])) {
    $from_date = date("Y-m-d", strtotime($_GET['from_date']));
    $to_date = date("Y-m-d", strtotime($_GET['to_date']));
    $start_time = $_GET['start_time'];
    $end_time = $_GET['end_time'];

    $q_time = "SELECT * FROM `time` WHERE `date` BETWEEN '$from_date' AND '$to_date' AND `startstime` >= '$start_time' AND `endstime` <= '$end_time'";


    

    $result = mysqli_query($conn, $q_time);

 

    if (mysqli_num_rows($result) > 0) {
        while ($f_time = mysqli_fetch_array($result)) {
            ?>
            <tr>
                <td><?php echo $f_time['student_idno'] ?></td>
                <td><?php echo htmlentities($f_time['student_name']) ?></td>
                <td><?php echo date("h:i a", strtotime($f_time['startstime'])) ?></td>
				<td><?php echo ($f_time['endstime'] === '00:00:00') ? "--:--:--" : date("h:i a", strtotime($f_time['endstime'])) ?></td>
                <td><?php echo date("m-d-Y", strtotime($f_time['date'])) ?></td>
            </tr>
            <?php
        }
    } else {
        echo "<tr><td colspan='4'>No Record Found</td></tr>";
    }
} else {
    $q_time = "SELECT * FROM `time`";

    $result = mysqli_query($conn, $q_time);

    while ($f_time = mysqli_fetch_array($result)) {
        ?>
        <tr>
            <td><?php echo $f_time['student_idno'] ?></td>
            <td><?php echo htmlentities($f_time['student_name']) ?></td>
            <td><?php echo date("h:i a", strtotime($f_time['startstime'])) ?></td>
            <td><?php echo ($f_time['endstime'] === '00:00:00') ? "--:--:--" : date("h:i a", strtotime($f_time['endstime'])) ?></td>
            <td><?php echo date("m-d-Y", strtotime($f_time['date'])) ?></td>
        </tr>
        <?php
    }
}


?>
</tbody>


				</table>
			<br />
			<br />	
			<br />	
			</div>
		</div>

	</body>
	<script src = "js/jquery.js"></script>
	<script src = "js/bootstrap.js"></script>
	<script src = "js/jquery.dataTables.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$('#table').DataTable();
		});
	</script>
	
	</script>

	<style>
@media print {
   table, th, td {
      border: 1px solid black;
   }
}
</style>

<script>
   function printData() {
      var q_course = document.getElementById("course").value;
      var divToPrint = document.getElementById("table");
      var newWin = window.open("");
      newWin.document.write("<html><head><style>@media print { table, th, td { border: 1px solid black; } }</style></head><body>");
      newWin.document.write("<div style='text-align:center;margin-bottom:10px;'><h2>University of Perpetual Help System Laguna - Jonelta</h2>");
      newWin.document.write("<p>Student In and Out Monitoring with RFID System - CLAB 3</p>");
      newWin.document.write("<p>Course code: " + q_course + "</p></div>");
      newWin.document.write(divToPrint.outerHTML);
      newWin.document.write("</body></html>");
      newWin.document.close();
      newWin.focus();
      newWin.print();
      newWin.close();
   }
</script>

	

</html>