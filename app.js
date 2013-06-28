// Generated by CoffeeScript 1.6.2
(function() {
  $(document).ready(function() {
    var bindEvents, doStuffWithPhotos, init, setPhotoProperties;

    doStuffWithPhotos = function(photos) {
      return $.each(photos, function(index, photo) {
        var photoImage, photoURL;

        photoURL = photo.image_url;
        photoImage = "<div class='item fade'>          <h3>" + photo.name + "</h3>          <img src=" + photoURL + "  />        </div>";
        return $('.photos').append(photoImage);
      });
    };
    bindEvents = function() {
      $("#editors_choice").click(function() {
        $(this).toggleClass('active');
        $("#popular").removeClass('active');
        return _500px.api("/photos", {
          feature: 'editors',
          image_size: 440,
          page: 1
        }, function(response) {
          $('.photos').empty();
          return doStuffWithPhotos(response.data.photos);
        });
      });
      return $("#popular").click(function() {
        $(this).toggleClass('active');
        $("#editors_choice").removeClass('active');
        return _500px.api("/photos", {
          feature: 'popular',
          image_size: 440,
          page: 1
        }, function(response) {
          $('.photos').empty();
          return doStuffWithPhotos(response.data.photos);
        });
      });
    };
    setPhotoProperties = function() {
      $(document).on("dragstart", ".photos .item", function(e) {
        return e.preventDefault();
      });
      return $(document).on("contextmenu", ".photos .item img", function(e) {
        return false;
      });
    };
    init = function() {
      _500px.init({
        sdk_key: 'e4671f3b61a876dfe887c5031b43d3dd900b63ce'
      });
      _500px.api("/photos", {
        feature: 'popular',
        image_size: 440,
        page: 1
      }, function(response) {
        return doStuffWithPhotos(response.data.photos);
      });
      bindEvents();
      return setPhotoProperties();
    };
    return init();
  });

}).call(this);
