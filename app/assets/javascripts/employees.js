$(document).on("page:change",function(){
  $( "#department_hover" ).hover(function() {
      $(this).append("<a href='/departments'><div class='title_append'>Our Department data description goes here</div></a>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $( "#job_hover" ).hover(function() {
      $(this).append("<a href='/departments/1/year/2016'><div class='title_append'>Our Job data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $( "#gender_hover" ).hover(function() {
      $(this).append("<a href='/employees/index'><div class='title_append'>Our Gender data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $("#job_route").submit(function(event) {
    event.preventDefault();
    alert("Hi");
    // var departmentId = $("#department_id").val();
    // var jobTitleId = $("#job_title").val();
    // var year = $("#year").val();
    // window.location = "http://localhost:3000/departments/"
    //                  + departmentId + "/job_title/" + jobTitleId + "/year/" + year;
  });
});
