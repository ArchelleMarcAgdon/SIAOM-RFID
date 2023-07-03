<?php
	require_once 'connect.php';
	$conn->query("DELETE FROM `course` WHERE `coursecode` = '$_REQUEST[coursecode]'") or die(mysqli_error());
	header('location:course.php');