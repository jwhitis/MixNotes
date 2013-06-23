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

  // Show and hide edit mix links
  $(".edit-mix").hide();
  $("#edit-mix-heading").click(function() {
    $(".edit-mix").toggle();
    if ($(this).hasClass("editing")) {
      $(this).text("Edit");
    } else {
      $(this).text("Done");
    };
    $(this).toggleClass("editing");
  });

});