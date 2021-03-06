$(document).on("ready",function(){
  $( "#department_hover" ).hover(function() {
      $(this).append("<a href='/departments'><div class='title_append'><img alt='department_data' id='department_data_graph' src='/assets/budget_data' /></div></a>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $( "#job_hover" ).hover(function() {
      $(this).append("<a href='/departments/1/year/2016'><div class='title_append'><img alt='job_chart_data' id='job_chart_data_graph' src='/assets/department_graph' /></div>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $( "#gender_hover" ).hover(function() {
      $(this).append("<a href='/employees/index'><div class='title_append'><img alt='gender_gap' id='gender_gap_graph' src='/assets/gender_data' /></div>");
    }, function(){
        $(this).find("a:last").remove()
  });

  $("#dept").submit(function(event) {
    event.preventDefault();
    var departmentId = $("#department").val();
    var year = $("#year").val();
    window.location = "/departments/"
                     + departmentId + "/year/" + year;
  });
});
