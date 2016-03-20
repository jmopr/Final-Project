$("#generalbutton").click(function(event){
  event.preventDefault();
  $("#secret").show();
  $("#theDiv").show();
})

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
