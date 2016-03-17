$(document).on("page:change",function(){
  $("#job_route").submit(function(event) {
    event.preventDefault();
    alert("Hi!");
    //   var departmentId = $("#department").val();
    //   var jobTitleId = $("#job_route").val();
    //   var year = $("#year").val();
    //   window.location = "http://localhost:3000/departments/"
    //                    + departmentId + "/job_title/" + jobTitleId + "/year/" + year;
  });
});
