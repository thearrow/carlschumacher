#= require zepto
#= require magnific-popup

$ ->
  $(".gallery").magnificPopup
    delegate: "a"
    type: "image"
    gallery:
      enabled: true
      navigateByImgClick: true
      preload: [0, 1]