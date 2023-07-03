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
				<li class = "dropdown active">
					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#"><span class = "glyphicon glyphicon-cog"></span> Accounts <span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "admin.php"><span class = "glyphicon glyphicon-user"></span> Admin</a></li>
						<li><a href = "student.php"><span class = "glyphicon glyphicon-user"></span> Student</a></li>
						<li><a href = "course.php"><span class = "glyphicon glyphicon-book"></span> Course</a></li>
					</ul>
				</li>
				<li><a href = "record.php"><span class = "glyphicon glyphicon-book"></span> Logs</a></li>
			</ul>
			<br />
			<div class = "alert alert-info">Accounts / Course</div>
			<div class = "modal fade" id = "add_course" tabindex = "-1" role = "dialog" aria-labelledby = "myModallabel">
				<div class = "modal-dialog" role = "document">
					<div class = "modal-content panel-primary">
						<div class = "modal-header panel-heading">
							<button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close"><span aria-hidden = "true">&times;</span></button>
							<h4 class = "modal-title" id = "myModallabel">Add new Course</h4>
						</div>
						<form method = "POST" action = "save_course_query.php" enctype = "multipart/form-data">
							<div class  = "modal-body">
								<div class = "form-group">
									<label>Course Code:</label>
									<input type = "text" name = "coursecode" required = "required" class = "form-control" />
								</div>
								<div class = "form-group">
									<label>Course Title:</label>
									<input type = "text" name = "coursetitle" required = "required" class = "form-control" />
								</div>
								<div class="form-group">
									<label>Day:</label><br>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Monday" id="monday">
										<label class="form-check-label" for="monday">
											Monday
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Tuesday" id="tuesday">
										<label class="form-check-label" for="tuesday">
											Tuesday
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Wednesday" id="wednesday">
										<label class="form-check-label" for="wednesday">
											Wednesday
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Thursday" id="thursday">
										<label class="form-check-label" for="thursday">
											Thursday
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Friday" id="friday">
										<label class="form-check-label" for="friday">
											Friday
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="day[]" value="Saturday" id="saturday">
										<label class="form-check-label" for="saturday">
											Saturday
										</label>
									</div>
								</div>



								</div>
								<div class="form-group">
  									<label for="time-range">Time:</label>
  									<div class="input-group">
    								<input type="time" id="starttime" name="starttime" required="required" class="form-control" min="00:00" max="23:59">
    								<div class="input-group-addon">to</div>
    								<input type="time" id="endtime" name="endtime" required="required" class="form-control" min="00:00" max="23:59">
  								</div>
								</div>



								
							<div class = "modal-footer">
								<button  class = "btn btn-primary" name = "save"><span class = "glyphicon glyphicon-save"></span> Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class = "modal fade" id = "delete" tabindex = "-1" role = "dialog" aria-labelledby = "myModallabel">
				<div class = "modal-dialog" role = "document">
					<div class = "modal-content ">
						<div class = "modal-body">
							<center><label class = "text-danger">Are you sure you want to delete this record?</label></center>
							<br />
							<center><a class = "btn btn-danger remove_id" ><span class = "glyphicon glyphicon-trash"></span> Yes</a> <button type = "button" class = "btn btn-warning" data-dismiss = "modal" aria-label = "No"><span class = "glyphicon glyphicon-remove"></span> No</button></center>
						</div>
					</div>
				</div>
			</div>
			<div class = "modal fade" id = "edit_course" tabindex = "-1" role = "dialog" aria-labelledby = "myModallabel">
				<div class = "modal-dialog" role = "document">
					<div class = "modal-content panel-warning">
						<div class = "modal-header panel-heading">
							<button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close"><span aria-hidden = "true">&times;</span></button>
							<h4 class = "modal-title" id = "myModallabel">Edit Course</h4>
						</div>
						<div id = "edit_query"></div>
					</div>
				</div>
			</div>
			<div class = "well col-lg-12">
				<button class = "btn btn-success" type = "button" href = "#" data-toggle = "modal" data-target = "#add_course"><span class = "glyphicon glyphicon-plus"></span> Add new </button>
				<br />
				<br />
				<table id = "table" class = "table table-bordered">
					<thead class = "alert-info">
						<tr>
							<th>Course code</th>
							<th>Course title</th>
							<th>Day</th>
							<th>Time</th>
                            <th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$q_course = $conn->query("SELECT * FROM `course`") or die(mysqli_error());
							while($f_course = $q_course->fetch_array()){
						?>
					<tr>
							<td><?php echo $f_course['coursecode']?></td>
							<td><?php echo $f_course['coursetitle']?></td>
							<td>
								<?php
									if (!empty($f_course['day'])) {
										echo "" . implode(", ", explode("|", $f_course['day']));
									} else {
										echo "No days selected";
									}
								?>
							</td>



							<td><?php echo date("h:i a", strtotime($f_course['starttime'])) . ' - ' . date("h:i a", strtotime($f_course['endtime'])) ?></td>


							
							<td><a class = "btn btn-danger rcoursecode" name = "<?php echo $f_course['coursecode']?>" href = "#" data-toggle = "modal" data-target = "#delete"><span class = "glyphicon glyphicon-remove"></span></a> <a class = "btn btn-warning  ecoursecode" name = "<?php echo $f_course['coursecode']?>" href = "#" data-toggle = "modal" data-target = "#edit_course"><span class = "glyphicon glyphicon-edit"></span></a></td>
						</tr>
						<?php
							}
						?>
					</tbody>
				</table>
			</div>
			<br />
			<br />	
			<br />	
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
	<script type = "text/javascript">
		$(document).ready(function(){
			$('.rcoursecode').click(function(){
				$coursecode = $(this).attr('name');
				$('.remove_id').click(function(){
					window.location = 'delete_course.php?coursecode=' + $coursecode;
				});
			});
			$('.ecoursecode').click(function(){
				$coursecode = $(this).attr('name');
				$('#edit_query').load('load_course_edit.php?coursecode=' + $coursecode);
			});
		});
	</script>
</html>