$(document).ready(function(){

  // Instantiate jPlayer
  $("#jquery_jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", {
        mp3: $(this).attr("data-url")
      });
    },
    swfPath: "../../../vendor/assets",
    supplied: "mp3",
    timeupdate: function() {
      $(this).on($.jPlayer.event.timeupdate, function(event) {
        var time = Math.round(event.jPlayer.status.currentTime);
        $("#comment_time").val(time);
      });
    }
  });

  // Display comment time
  $(".time").on("click", function() {
    var time = Number($(this).attr("data-time"));
    $("#jquery_jplayer_1").jPlayer("play", time);
  });

  // Show and hide replies
  $(".reply-row").hide();
  $(".comment-row").click(function() {
    if ($(this).hasClass("expanded")) {
      $(this).nextUntil(".comment-row").hide();
    } else {
      $(".expanded").nextUntil(".comment-row").hide();
      $(".expanded").removeClass("expanded");
      $(this).nextUntil(".comment-row").show("fast");
    };
    $(this).toggleClass("expanded");
  });

  // Show and hide delete comment links
  $(".delete-comment").hide();
  $("#delete-comment-heading").click(function() {
    $(".delete-comment").toggle();
    if ($(this).hasClass("editing")) {
      $(this).text("Edit");
    } else {
      $(this).text("Done");
    };
    $(this).toggleClass("editing");
  });

});