$(document).ready(function() {

  // Change background color of unread activities
  $("#activity-table > tbody > tr").each(function() {
    if ($(this).attr("data-id")) {
      $(this).css("background-color", "#a6ffa0");
    };
  });

  // Revert background color and destroy notification
  $("#activity-table > tbody > tr").click(function() {
    if ($(this).attr("data-id")) {
      $(this).css("background-color", "inherit");
      decrementCounter();
      $.ajax({
        url: "/notifications/" + $(this).attr("data-id"),
        type: "DELETE",
        dataType: "HTML"
      });
    };
  });

  // Decrement notifications counter
  function decrementCounter() {
    count = $("#count").text();
    $("#count").text(count - 1);
  };

});