$(document).ready(function(){

  // Display file to be uploaded
  $("#mix_audio").change(function() {
    var filename = $(this).val().split("\\");
    $("#upload-filename").text(filename[filename.length - 1]);
  });

  // Show and hide upload status
  $("#new_mix").submit(function() {
    $("#upload-status").show();
  });
  $('#new-mix-modal').on("hidden", function() {
    $("#upload-status").hide();
  });

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
    $(this).nextUntil(".comment-row").toggle("fast");
  });

});