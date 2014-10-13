$(document).ready(function(){
  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $(".nav > li > ul").slideUp(350);
      $(".nav > li").removeClass("open");
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });

});

$(function(){
var textfield = $("input[name=biketoken]");
  $('button[type="submit"]').click(function(e) {
      e.preventDefault();
      //little validation just to check username
      if (textfield.val() != "") {
        //$("body").scrollTo("#output");
        $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
        $("#output").removeClass('alert-danger');
        $("input").css({
          "height":"0",
          "padding":"0",
          "margin":"0",
          "opacity":"0"
        });
        //change button text
        $('button[type="submit"]').html("continue")
          .removeClass("btn-info")
          .addClass("btn-default").click(function() {
            // $("input").css({
            //   "height":"auto",
            //   "padding":"10px",
            //   "opacity":"1"
            // }).val("");
          });
      } else {
        $("#output").removeClass(' alert alert-success');
        $("#output").addClass("alert alert-danger animated fadeInUp").html("Enter your JC Decaux Developer Token to start!");
      }
  });
});
