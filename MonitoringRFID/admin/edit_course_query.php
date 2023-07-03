<?php
    require_once 'connect.php';

    $coursecode = $_POST['coursecode'];
    $coursetitle = $_POST['coursetitle'];

    $days = isset($_POST['day']) ? implode(", ", $_POST['day']) : "";

    $starttime = $_POST['starttime'];
    $endtime = $_POST ['endtime'];

    // use backticks instead of single quotes around column names
	$conn->query("UPDATE `course` SET `coursecode` = '$coursecode', `coursetitle` = '$coursetitle', `day` = '$days', `starttime` = '$starttime', `endtime` = '$endtime' WHERE `coursecode` = '$coursecode'") or die(mysqli_error($conn));



    echo '
        <script type="text/javascript">
            alert("Successfully Edited");
            window.location = "course.php";
        </script>
    ';
?>
