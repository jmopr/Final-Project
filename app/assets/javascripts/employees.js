$(document).on("page:change",function(){
  $( "#department_hover" ).hover(function() {
      $(this).append("<a href='/departments'><div class='title_append'>Our Department data description goes here</div></a>");
    }, function(){
        $(this).find("a:last").remove()
  });
// });

// $(document).ready(function(){
  $( "#job_hover" ).hover(function() {
      $(this).append("<a href='/job_titles/show'><div class='title_append'>Our Job data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });
// });

// $(document).ready(function(){
  $( "#gender_hover" ).hover(function() {
      $(this).append("<div class='title_append'>Our Gender data description goes here</div>");
    }, function(){
        $(this).find("a:last").remove()
  });
});
