<?php
require_once 'admin/connect.php';
session_start();
$last_student = isset($_SESSION['last_student']) ? $_SESSION['last_student'] : "";
$student = $_POST['student'];

if ($student == $last_student) {
    $elapsed_time = time() - $_SESSION['last_time'];
    if ($elapsed_time < 30) {
        echo 'Please wait for 30 seconds';
        exit();
    }
}
$q_student = $conn->query("SELECT * FROM `student` WHERE `student_no` = '$student'") or die(mysqli_error());
$v_student = $q_student->num_rows;

if($v_student > 0){
    $_SESSION['last_student'] = $student; // Remember the last student detected
    $_SESSION['last_time'] = time(); // Remember the time when the current student was detected
    echo 'Success';
} else {
    echo 'Error';
    
}

?>
