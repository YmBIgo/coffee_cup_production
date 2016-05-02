$(function(){
    $('a[href^=#]').click(function(){ 
        var speed = 500; //移動完了までの時間(sec)を指定
        var href= $(this).attr("href"); 
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({scrollTop:position}, speed, "swing");
        return false;
    });
});

      var x = 133;
    function larger()  {
      x *= 1.1;
      var selected_doc = document.getElementsByTagName("h4");
      for(var i = 0; i < selected_doc.length; i++){
        selected_doc[i].style.fontSize = x+"%";
      }
    }
    function smaller() {
      x /= 1.1;
      var selected_doc = document.getElementsByTagName("h4");
      for(var i = 0; i < selected_doc.length; i++){
        selected_doc[i].style.fontSize = x+"%";
      }
    }