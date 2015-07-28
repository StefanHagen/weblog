// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function bootstrapMultiSelect(){
  $(".bootstrap-multiselect").multiselect();
}

function activateBooleanFields(){
  $(".ajax-checkbox").click(function(){
    $(this).parent().submit();
  });
}