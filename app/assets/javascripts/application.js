// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .




jQuery(function () {
  var pagetop = $('#page_top');
  pagetop.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {  //100pxスクロールしたら表示
      pagetop.fadeIn();
    } else {
      pagetop.fadeOut();
    }
  });
  pagetop.click(function () {
    $('body,html').animate({
      scrollTop: 0
    }, 500); //0.5秒かけてトップへ移動
    return false;
  });
});


$('.menu').on('click', function () {
  $(this).toggleClass('on');
  if ($('.fullnav').hasClass('on')) {//fullnavが開いている時
    $('.fullnav').removeClass('on').fadeOut();
  }
  else {//fullnavが閉じている時
    $('.fullnav').fadeIn();
    setTimeout(function () {
      $(".fullnav").addClass("on");
    }, 200);
  }
});




$(document).ready(function () {

  // INITIATE THE FOOTER
  siteFooter();
  // COULD BE SIMPLIFIED FOR THIS PEN BUT I WANT TO MAKE IT AS EASY TO PUT INTO YOUR SITE AS POSSIBLE
  $(window).resize(function () {
    siteFooter();
  });

  function siteFooter() {
    var siteContent = $('#site-content');
    var siteContentHeight = siteContent.height();
    var siteContentWidth = siteContent.width();

    var siteFooter = $('#site-footer');
    var siteFooterHeight = siteFooter.height();
    var siteFooterWidth = siteFooter.width();

    console.log('Content Height = ' + siteContentHeight + 'px');
    console.log('Content Width = ' + siteContentWidth + 'px');
    console.log('Footer Height = ' + siteFooterHeight + 'px');
    console.log('Footer Width = ' + siteFooterWidth + 'px');

    siteContent.css({
      "margin-bottom": siteFooterHeight + 50
    });
  };
});
