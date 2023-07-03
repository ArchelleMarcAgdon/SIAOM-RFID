<?php
	require_once 'connect.php';
	if(ISSET($_POST['save'])){
		$coursecode = $_POST['coursecode'];
		$coursetitle = $_POST['coursetitle'];
		$day = $_POST['day'];
		$starttime = $_POST['starttime'];
		$endtime = $_POST ['endtime'];
		$q_checkcourse = $conn->query("SELECT * FROM `course` WHERE `coursecode` = '$coursecode'") or die(mysqli_error());
		$v_checkcourse = $q_checkcourse->num_rows;
		if($v_checkcourse == 1){
			echo '
				<script type = "text/javascript">
					alert("Course is already exist");
					window.location = "course.php";
				</script>
			';
		}else{

			$days = implode(", ", $day);
			$conn->query("INSERT INTO `course` VALUES('$coursecode', '$coursetitle', '$days', '$starttime', '$endtime' )") or die(mysqli_error());
			
			echo '
				<script type = "text/javascript">
					alert("Saved Record");
					window.location = "course.php";
				</script>
			';
	}	
}
