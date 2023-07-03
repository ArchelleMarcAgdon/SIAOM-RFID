<?php
	require_once 'connect.php';
	if(ISSET($_POST['save'])){
		$student_no = $_POST['student_no'];
		$student_idno = $_POST['student_idno'];
		$firstname = $_POST['firstname'];
		$middlename = $_POST['middlename'];
		$lastname = $_POST['lastname'];
		$course = $_POST['course'];
		$section = $_POST['section'];
		$q_checkstudent = $conn->query("SELECT * FROM `student` WHERE `student_no` = '$student_no'") or die(mysqli_error());
		$v_checkstudent = $q_checkstudent->num_rows;
		if($v_checkstudent == 1){
			echo '
				<script type = "text/javascript">
					alert("Student is already exist");
					window.location = "student.php";
				</script>
			';
		}else{

		$conn->query("INSERT INTO `student` VALUES('', '$student_no', '$student_idno','$firstname', '$middlename', '$lastname', '$course', '$section', 'OUT', ' ', ' ', ' ')") or die(mysqli_error());
			echo '
				<script type = "text/javascript">
					alert("Saved Record");
					window.location = "student.php";
				</script>
			';
	}	
}
