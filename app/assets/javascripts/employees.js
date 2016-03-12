$(document).ready(function(){
  $( "#department_hover" ).hover(function() {
      $(this).append("<div class='title_append'>Our Depertment data description goes here</div>");
    }, function(){
        $(this).find("div:last").remove()
  });
});

$(document).ready(function(){
  $( "#job_hover" ).hover(function() {
      $(this).append("<div class='title_append'>Our Job data description goes here</div>");
    }, function(){
        $(this).find("div:last").remove()
  });
});

$(document).ready(function(){
  $( "#gender_hover" ).hover(function() {
      $(this).append("<div class='title_append'>Our Gender data description goes here</div>");
    }, function(){
        $(this).find("div:last").remove()
  });
});
