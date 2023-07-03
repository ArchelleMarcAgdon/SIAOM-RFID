<?php
require_once 'admin/connect.php';

$student = $_POST['student'];
$user_status_query = $conn->query("SELECT user_status FROM `student` WHERE `student_no` = '$student'") or die(mysqli_error());
$user_status = $user_status_query->fetch_array()['user_status'];
date_default_timezone_set('Asia/Manila');
$date = date("Y/m/d");
$q_student = $conn->query("SELECT * FROM `student` WHERE `student_no` = '$student'") or die(mysqli_error());
$f_student = $q_student->fetch_array();
$student_name = $f_student['lastname']." ".$f_student['firstname'];
$student_idno = $f_student ['student_idno'];

$startstime_query = $conn->query("SELECT startstime, endstime, time_id FROM `time` WHERE `student_no` = '$student' AND `date` = '$date' ORDER BY `time_id` DESC LIMIT 1") or die(mysqli_error());

if ($startstime_query->num_rows > 0) {
  // student already has an active record, update end time
  $row = $startstime_query->fetch_array();
  $startstime = $row['startstime'];
  $endstime = $row['endstime'];
  $time_id = $row['time_id'];
  
  if ($endstime == '00:00:00') {
    // end time is default, update it with current time
    $endstime = date("H:i:s");
    if ($endstime == '00:00:00') {
      $endstime = null; // set end time to null if the time is 00:00:00
    }
    $conn->query("UPDATE `time` SET `endstime`='$endstime' WHERE `time_id`='$time_id'") or die(mysqli_error());
  } else {
    // end time is not default, insert new row
    $startstime = date("H:i:s");
    $endstime = "00:00:00";
    $conn->query("INSERT INTO `time` VALUES('', '$student', '$student_idno', '$student_name', '$startstime', '$endstime', '$date')") or die(mysqli_error());
  }
} else {
  // student does not have an active record, insert new record
  $startstime = date("H:i:s");
  $endstime = "00:00:00";
  if ($endstime == '00:00:00') {
    $endstime = null; // set end time to null if the time is 00:00:00
  }
  $conn->query("INSERT INTO `time` VALUES('', '$student', '$student_idno', '$student_name', '$startstime', '$endstime', '$date')") or die(mysqli_error());
  $status_label = "Time In";
}



if ($user_status === 'OUT') {
    // User is OUT, stop timer and update status to IN
    $conn->query("UPDATE `student` SET user_status = 'IN' WHERE student_no = '$student'") or die(mysqli_error());
    $user_status = 'IN';
    $stop_time = date("H:i:s", strtotime("+7 HOURS"));
    $start_time = $f_student['start_time'];
    $time_spent = $f_student['time_spent'];

    if (is_numeric($time_spent) && $start_time != null) {
        // Calculate the time spent
        $start_time_in_sec = strtotime($start_time);
        $stop_time_in_sec = strtotime($stop_time);
        $time_spent_in_sec = $time_spent + ($stop_time_in_sec - $start_time_in_sec);

        $conn->query("UPDATE `student` SET time_spent = $time_spent_in_sec WHERE student_no = '$student'") or die(mysqli_error());
    } elseif ($start_time == null) {
        // New student, initialize start time and time spent to 0
        $start_time = $stop_time;
        $conn->query("UPDATE `student` SET start_time = '$start_time', time_spent = 0 WHERE student_no = '$student'") or die(mysqli_error());
    }

    $conn->query("UPDATE `student` SET start_time = '$stop_time' WHERE student_no = '$student'") or die(mysqli_error());
} else {
    // User is IN, start timer and update status to OUT
    $conn->query("UPDATE `student` SET user_status = 'OUT' WHERE student_no = '$student'") or die(mysqli_error());
    $user_status = 'OUT';
    $start_time = $f_student['start_time'];
    $time_spent = $f_student['time_spent'];

    if ($start_time == null) {
        // First time going IN, initialize start time to current time
        $start_time = date("H:i:s", strtotime("+7 HOURS"));
        $conn->query("UPDATE `student` SET start_time = '$start_time' WHERE student_no = '$student'") or die(mysqli_error());
    } else {
        // Calculate the time spent
        $start_time_in_sec = strtotime($start_time);
        $stop_time_in_sec = strtotime(date("H:i:s", strtotime("+7 HOURS")));
        $time_spent_in_sec = intval($time_spent) + ($stop_time_in_sec - $start_time_in_sec);

        $conn->query("UPDATE `student` SET time_spent = $time_spent_in_sec WHERE student_no = '$student'") or die(mysqli_error());
    }

}

echo "<h3 class='text-muted'>" . $student_name . " <label class='text-info'>at  " . date("h:i a", strtotime(date_default_timezone_get())) . "</label>, <strong class='text-info'>Status:</strong> <label class='text-info'>" . $user_status . "</label></h3>";
?>

