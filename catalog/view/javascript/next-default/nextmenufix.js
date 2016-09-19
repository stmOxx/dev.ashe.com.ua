$(function(){
 $(window).scroll(function() {
 var top = $(document).scrollTop();
  if(parseInt(window.innerWidth) > '767'){
   if (top < 76){
     $("#top3").removeClass("hidden-xs").css({top: '0', position: 'relative'});
   }else {
    $("#top3").addClass("hidden-xs").css({top: '-16px', left: '0', position: 'fixed', width:'100%'});
   }
  }
 });
});

$(function(){
var pageYLabel = 0;

 $(window)
 .load(function() {
  var pageY = $(window).scrollTop();
 if (pageY > 200) {
  $("#up").show();
 }
 })
 .scroll(function(e){
  var pageY = $(window).scrollTop();
  var innerHeight = $(window).innerHeight();
  var docHeight = $(document).height();
 if (pageY > innerHeight) {
         $("#up").show();
 }else{$("#up").hide();}

 if (pageY < innerHeight && pageYLabel >= innerHeight) {
         $("#down").show();
 }else{$("#down").hide();}
 });

 $('#up').click(
 function() {
  var pageY = $(window).scrollTop();
  pageYLabel = pageY;
  $("html,body").animate({scrollTop:0},"slow");
 });
 $('#down').click(
 function(){
  $("html,body").animate({scrollTop:pageYLabel},"slow");
 });
});