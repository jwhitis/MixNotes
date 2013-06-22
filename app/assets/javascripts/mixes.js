$(document).ready(function(){

  $("#mix_audio").change(function() {
    var filename = $(this).val().split("\\");
    $("#upload-text").text(filename[filename.length - 1]);
  });

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

  $(".time").on("click", function() {
    var time = Number($(this).attr("data-time"));
    $("#jquery_jplayer_1").jPlayer("play", time);
  });

  $(".reply-row").hide();
  $(".comment-row").click(function() {
    $(this).nextUntil(".comment-row").toggle("fast");
  });

});