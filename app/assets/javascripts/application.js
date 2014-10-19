// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require select2
//= require moment
//= require bootstrap-datetimepicker


$(function() {

  $('#allinone_carousel_charming').allinone_carousel({
    skin: 'charming',
    width:960,
    height:500,
    width100Proc:false,
    height100Proc:false,
    autoPlay:4,
    numberOfVisibleItems:3, // odd number: 3,5,7,9
    elementsHorizontalSpacing:240,
    elementsVerticalSpacing:54,
    verticalAdjustment:0,
    animationTime:0.8,
    easing:'easeOutQuad',
    resizeImages:true,
    target:"_blank",
    showElementTitle:true,
    showAllControllers:true,
    showNavArrows:true,
    showOnInitNavArrows:true, // o1
    autoHideNavArrows:false, // o1
    showBottomNav:false,
    showOnInitBottomNav:true, // o2
    autoHideBottomNav:true, // o2
    showPreviewThumbs:false,
    nextPrevMarginTop:20,
    playMovieMarginTop:0,
    enableTouchScreen:true,
    absUrl:'',

    showCircleTimer:true,
    showCircleTimerIE8IE7:false,
    circleRadius:10,
    circleLineWidth:4,
    circleColor: "#F1C40F",
    circleAlpha: 100,
    behindCircleColor: "#4A4A4A",
    behindCircleAlpha: 50,
    circleLeftPositionCorrection:3,
    circleTopPositionCorrection:3,

    responsive:true,
    responsiveRelativeToBrowser:true,

    bottomNavMarginBottom:0,

    origWidth:0,
    origHeight:0,
    contentHolderUnitOrigWidth:0,
    contentHolderUnitOrigHeight:0,
    elementOrigTop:0,
    origthumbsHolder_MarginTop:0,
    windowOrientationScreenSize0:0,
    windowOrientationScreenSize90:0,
    windowOrientationScreenSize_90:0,
    windowCurOrientation:0
  });

  $(".js-add-movie").click(function(event){
    event.stopPropagation();
    alert("The element was clicked.");
  });

  $(document).on("click", ".js-close-movie-details", function(event){

    var last_movie_id = $(".movie-detail").data("movie-id");
    $(".js-movie-details-"+last_movie_id).removeClass("active");

    $(this).closest(".movie-detail").fadeOut().remove();
  });


});