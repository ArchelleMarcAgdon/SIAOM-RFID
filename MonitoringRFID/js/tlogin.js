$(document).ready(function(){
  $error = $('<center><h2 class="text-danger">INVALID ID!<h2></center>');
  $error1 = $('<center><h2 class="text-danger">Please fill up the field<h2></center>');
  $error2 = $('<center><h2 class="text-danger">Please wait for 30 seconds<h2></center>');

  var lastStudent = "";
  var canInput = true;

  $('#student').on('keypress', function(e){
    if(e.which == 13){
      e.preventDefault();
      $('#login').click();
    }
  });

  $('#login').click(function(){
    $error.remove();
    $error1.remove();
    $error2.remove();
    $student = $('#student').val();
    if($student == ""){
      $error1.appendTo('#error');
    } else if(lastStudent == $student && !canInput){
      $error.appendTo('#error');
    } else {  
      $.post('check.php', {student: $student}, function(show){
        if(show == 'Success'){
          lastStudent = $student;
          canInput = false;
          $.ajax({
            type: 'POST',
            url: 'login.php',
            data: {
              student: $student
            },
            success: function(result){
              $result = $('<h2 class="text-warning">You are:</h2> ' + result).appendTo('#result');
              $('#student').val('');
              setTimeout(function(){
                $result.remove();
              }, 3000);
              setTimeout(function(){
                canInput = true;
              }, 5000);
            }
          });
        } else if(show == 'Please wait for 30 seconds') {
          $error2.appendTo('#error');
          setTimeout(function(){
            $error2.remove();
          }, 30000);
        } else {
          $('#student').val('');
          $error.appendTo('#error');
        }
      }).always(function() {
        // clear input box after request is completed, regardless of the result
        $('#student').val('');
      });
    } 
  });
});
