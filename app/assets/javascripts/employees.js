$(document).on("ready",function(){
  $("#department_hover").hover(function() {
    $(this).append("<a href='/departments'><div class='title_append'><img alt='department_data' id='department_data_graph' src='/assets/department_data' /></div></a>");
  }, function(){
    $(this).find("a:last").remove()
  });

  $("#job_hover").hover(function() {
    $(this).append("<a href='/departments/1/year/2016'><div class='title_append'><img alt='job_chart_data' id='job_chart_data_graph' src='/assets/job_chart_data' /></div>");
  }, function(){
    $(this).find("a:last").remove()
  });

  $("#gender_hover").hover(function() {
    $(this).append("<a href='/employees/index'><div class='title_append'><img alt='gender_gap' id='gender_gap_graph' src='/assets/gender_gap_data' /></div>");
  }, function(){
    $(this).find("a:last").remove()
  });

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
    }, 2000);
  });

  $("#topwomenbutton").click(function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $("#topwomen").offset().top
    }, 2000);
  });
});
