$(document).on("page:change",function(){
  $( "#department_hover" ).hover(function() {
      $(this).append("<a href='/departments'><div class='title_append'>Our Department data description goes here</div></a>");
    }, function(){
        $(this).find("a:last").remove()
  });
// });

// $(document).ready(function(){
  $( "#job_hover" ).hover(function() {
      $(this).append("<a href='/departments/1/year/2016'><div class='title_append'>Our Job data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });
// });

// $(document).ready(function(){
  $( "#gender_hover" ).hover(function() {
      $(this).append("<a href='/employees/index'><div class='title_append'>Our Gender data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $("#dept").submit(function(event) {
    event.preventDefault();
    var departmentId = $("#department").val();
    var year = $("#year").val();
    window.location = "http://localhost:3000/departments/"
                     + departmentId + "/year/" + year;
  });
});
