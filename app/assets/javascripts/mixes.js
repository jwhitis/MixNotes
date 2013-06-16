$(document).ready(function(){

  $("#jquery_jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", {
        m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
        oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
      });
    },
    swfPath: "../../../vendor/assets",
    supplied: "m4a, oga",
    timeupdate: function() {
      $(this).on($.jPlayer.event.timeupdate, function(event) {
        var time = Math.round(event.jPlayer.status.currentTime);
        $("#topic_time").val(time);
      });
    }
  });

  $(".time").on("click", function() {
    var time = Number($(this).attr("data-time"));
    $("#jquery_jplayer_1").jPlayer("play", time);
  });

});