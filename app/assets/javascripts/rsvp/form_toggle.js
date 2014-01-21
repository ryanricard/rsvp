$(function(){
  var $noLink = $("a.rsvp-no");
  var $yesLink = $("a.rsvp-yes");
  var $noFormContainer = $("div.rsvp-no").hide();
  var $yesFormContainer = $("div.rsvp-yes").hide();

  $noFormContainer.find("button:contains('Cancel')").click(function(event){
    $noFormContainer.hide();
  });

  $yesFormContainer.find("button:contains('Cancel')").click(function(event){
    $yesFormContainer.hide();
  });

  $noLink.click(function(){
    $yesFormContainer.hide();
    $yesLink.parent().removeClass("active");
    $noFormContainer.show();
    $noLink.parent().addClass("active");
  });

  $yesLink.click(function(){
    $noFormContainer.hide();
    $noLink.parent().removeClass("active");
    $yesFormContainer.show();
    $yesLink.parent().addClass("active");
  });

});