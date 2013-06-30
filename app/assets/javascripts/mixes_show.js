$(document).ready(function() {

  // Set media URL
  var userMedia = $("#jquery_jplayer_1").attr("data-url");
  var url = userMedia ? userMedia : "https://s3.amazonaws.com/mixnotes-production/mixnotes_default.mp3";

  // Instantiate jPlayer
  $("#jquery_jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", {
        mp3: url
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

  // Start player at comment time
  $(".time").on("click", function() {
    var time = Number($(this).attr("data-time"));
    $("#jquery_jplayer_1").jPlayer("play", time);
  });

  // Show and hide replies
  $(".reply-row").hide();
  $(".content").click(function() {
    var row = $(this).parent();
    if (row.hasClass("expanded")) {
      row.nextUntil(".comment-row").hide();
    } else {
      $(".expanded").nextUntil(".comment-row").hide();
      $(".expanded").removeClass("expanded");
      row.nextUntil(".comment-row").show("fast");
    };
    row.toggleClass("expanded");
  });

  // Show and hide delete comment links
  $(".edit-comment").hide();
  $("#edit-comment-heading").click(function() {
    $(".edit-comment").toggle();
    if ($(this).hasClass("editing")) {
      $(this).text("Edit");
    } else {
      $(this).text("Done");
    };
    $(this).toggleClass("editing");
  });

});