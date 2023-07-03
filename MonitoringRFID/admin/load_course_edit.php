<?php
	require_once 'connect.php';
	$q_edit_course = $conn->query("SELECT * FROM `course` WHERE `coursecode` = '$_REQUEST[coursecode]'") or die(mysqli_error());
	$f_edit_course = $q_edit_course->fetch_array();
?>
<form method = "POST" action = "edit_course_query.php?coursecode=<?php echo $f_edit_course['coursecode']?>" enctype = "multipart/form-data">
							<div class  = "modal-body">

								<div class = "form-group">
									<label>Course Code:</label>
									<input type= "text" name= "coursecode" required= "required" class= "form-control" value="<?php echo $f_edit_course['coursecode']; ?>" />
								</div>

								

								<div class = "form-group">
									<label>Course Title:</label>
									<input type = "text" name = "coursetitle" required = "required" class = "form-control" value="<?php echo $f_edit_course['coursetitle']; ?>"  />
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


							



							
									<div class="form-group">

										<label for="time-range">Time:</label>

										<div class="input-group">
											<input type="time" id="starttime" name="starttime" required="required" class="form-control" min="00:00" max="23:59" value="<?php echo $f_edit_course['starttime']; ?>">
											<div class="input-group-addon">to</div>
											<input type="time" id="endtime" name="endtime" required="required" class="form-control" min="00:00" max="23:59" value="<?php echo $f_edit_course['endtime']; ?>">
										</div>
									</div>
									


								</div>
								<div class = "modal-footer">
									<button  class = "btn btn-primary" name = "save"><span class = "glyphicon glyphicon-save"></span> Save</button>
								</div>

							
</form>	