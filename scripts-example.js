// scripts.js

// Add your custom JavaScript code here
$(document).ready(function() {
  // Example of using jQuery to manipulate the DOM or handle events
  $(".slider-input").on("input", function() {
    var value = $(this).val();
    $("#slider-value").text(value);
  });
});
