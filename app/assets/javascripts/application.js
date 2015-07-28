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
//= require bootstrap.min
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require bootstrap-multiselect
//= require turbolinks
//= require_tree .

var ready;
ready = function() {

  // Admin Namespace
  bootstrapMultiSelect();
  activateBooleanFields();

  // Root
  centerNavOrbs();
  detectScrollPosition();
}

$(document).ready(ready);
$(document).on("page:load", ready);

// Loop through .orb's and center them onto their respective buttons
function centerNavOrbs(){
  $(".orb").each(function(){
    parent_width = $(this).parent().width();
    margin_left = (parent_width/2) - 8;
    $(this).css("margin-left", margin_left + "px");
  })
}

// This function reads the scrollposition when the scroll event is fired, and toggles the nav shadow
function detectScrollPosition(){
  $(window).scroll(function(){
    position = $(this).scrollTop()
    toggleNavShadow(position);
  })
}

// Fade the navbar shadow in and out, based on the scrollposition
function toggleNavShadow(position){
  if(position > 0){
    $(".radial-shadow").fadeIn();
  } else {
    $(".radial-shadow").fadeOut();
  }
}