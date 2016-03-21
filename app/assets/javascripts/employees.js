$(document).on("ready",function(){
  $("#dept").submit(function(event) {
    event.preventDefault();
    var departmentId = $("#department").val();
    var year = $("#year").val();
    window.location = "/departments/" + departmentId + "/year/" + year;
  });

  $("#job_route").submit(function(event) {
    event.preventDefault();
    var departmentId = $("#department").val();
    var jobTitleId = $("#job_Title").val();
    var year = $("#year").val();
    window.location = "/departments/" + departmentId + "/job_titles/" + jobTitleId + "/year/" + year;
  });

  $("#generalbutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#general").offset().top
    }, 2000);
  });

  $(".search_button").click(function(event) {
    if ($('#dept').addEventListener) {
      return $('#dept').addEventListener('submit', function(event) {
        return event.preventDefault();
      }, true);
    }
  });

  $("#sidebutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#topwomen").offset().top
    }, 2000);
  });

  // $("#generalbutton").click(function(event){
  //   event.preventDefault();
  //   $("#secret").show();
  //   $("#theDiv").show();
  // })

  $("#toptenbutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#topten").offset().top
    }, 2000);
  });

  $("#topmenbutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#topmen").offset().top
    }, 2250);
  });

  $("#topwomenbutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#topwomen").offset().top
    }, 2500);
  });
});
