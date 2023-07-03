<?php
	require_once 'validator.php';
	require_once 'account.php';
	// retrieve course names
	$q_course = $conn->query("SELECT * FROM `course`") or die(mysqli_error());
	$courses = array();
	while($f_course = $q_course->fetch_array()){
		$courses[] = $f_course['coursecode'];
	}
?>
<html lang = "eng">
	<head>
		<title>Student In and Out Monitoring with RFID</title>
		<meta charset = "utf-8" />
		<meta name = "viewport" content = "width=device-width, initial-scale=1" />
		<link rel = "stylesheet" href = "css/bootstrap.css" />
		<link rel = "stylesheet" href = "css/jquery.dataTables.css" />
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
                <li><a href = "record.php"><span class = "glyphicon glyphicon-book"></span> Record</a></li>
                <li class = "active"><a href = "filter.php"><span class = "glyphicon glyphicon-book"></span> Filter</a></li>
			</ul>
			<br />
			<div class = "alert alert-info">Filter</div>
			<div class = "modal fade" id = "delete" tabindex = "-1" role = "dialog" aria-labelledby = "myModallabel">
			</div>
			<div class = "well col-lg-12">
				<div class="form-group">
					<label for="course">Course:</label>
					<select id="course"name="course" class="form-control">
                        <option value="">-- Select Course --</option>
                        <?php
                                                foreach($courses as $course){
                                                echo '<option value="'.$course.'">'.$course.'</option>';
                                                }
                                            ?>
                        </select>
                        </div>
                        <div class="form-group">
                            <label for="date">Date:</label>
                            <input type="date" id="date" name="date" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                        <button type="button" class="btn btn-primary" id="filter">Filter</button>
                        </div>
                        </div>
                        <br />
                        <div class = "row">
                        <div class = "col-lg-12">
                        <table id = "table" class = "table table-bordered">
                        <thead class = "alert-info">
                        <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Time</th>
                        <th>Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
						$q_filter = $conn->query("SELECT time.*, course.* FROM `time` JOIN `course` ON student_no = coursecode WHERE course.coursecode = 'coursecode' AND time.date = 'date'") or die(mysqli_error());
                        while($f_filter = $q_filter->fetch_array()){							
					?>	
						<tr>
							<td><?php echo $f_filter['student_no']?></td>
							<td><?php echo htmlentities($f_filter['student_name'])?></td>
							<td><?php echo date("h:i a", strtotime($f_filter['time']))?></td>
							<td><?php echo date("m-d-Y", strtotime($f_filter['date']))?></td>
						</tr>
					<?php
                        }
					?>	
				
					</tbody>
                        </table>
                        </div>
                        </div>
                        </div>
                        </body>

<script src = "js/jquery-3.2.1.js"></script>
<script src = "js/bootstrap.js"></script>
<script src = "js/jquery.dataTables.js"></script>
<script type = "text/javascript">
$(document).ready(function(){
show_record();
$('#filter').click(function(){
show_record();
});
});
function show_record(){
		var course = $('#course').val();
		var time = $('#time').val();
		
		$.ajax({
			url: 'record_data.php',
			type: 'POST',
			data: {
				course: course,
				time: time
			},
			success: function(response){
				$('#table tbody').html(response);
			}
		});
	}
</script>