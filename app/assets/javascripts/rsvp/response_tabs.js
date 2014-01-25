$(function(){
  (function(){
    var _tabs, _containers;
    var show = function(tab){
      _tabs.removeClass("active");
      _containers.hide();
      tab.addClass("active");
      $(tab.data("container")).show();
    };
    return {
      init: function(tabs, containers){
        _tabs = tabs;
        _containers = containers.hide();
        tabs.click(function(e){
          var tab = $(e.target);
          show(tab);
        });
        $(".tab.active").click();
      }
    };
  })().init($(".tab"), $(".container"));
});