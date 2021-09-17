var audio;

window.addEventListener('message', function (event) {
  var nui = event.data;
  if (nui.type == "open") {
    $('.white_bg').fadeIn(100);
    audio = new Audio("check.mp3")
    audio.play();
    console.log("open type!")
  }
});

window.addEventListener('message', function (event) {
    var nui = event.data;
    if (nui.type == "close") {
      $('.white_bg').fadeOut(100);
      console.log("close type!")
    }
});

window.addEventListener('message', function (event) {
    var nui = event.data;
    if (nui.type == "sidenotice") {
      $('.side_body').fadeIn(100);
      $('.side_noticepc').fadeIn(100);
      $('.side_notice').fadeIn(100);
      $('.side_noticebt').fadeIn(300);
      console.log("open type!")
    }
});

window.addEventListener('message', function (event) {
  var nui = event.data;
  if (nui.type == "closeside") {
    $('.side_body').fadeOut(100);
    $('.side_noticepc').fadeOut(100);
    $('.side_notice').fadeOut(100);
    $('.side_noticebt').fadeOut(300);
    audio.pause();
    console.log("close type!")
  }
});