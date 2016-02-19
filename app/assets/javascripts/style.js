$(function(){
  var fix    = $("#slide-bar");             //メニューオブジェクトを格納
  var fixTop = fix.offset().top;             //メニューの縦座標を格納
  $(window).scroll(function () {             //スクロールが発生したら開始
    if($(window).scrollTop() > fixTop ) {    //スクロール時の縦座標がメニューの縦座標以上なら…
      fix.addClass("fixed");
    } else {
      fix.removeClass("fixed");
    }
  });
});