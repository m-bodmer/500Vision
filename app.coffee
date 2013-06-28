# 500px Hack Day Project
# June 28, 2013
# Created by: Marc Bodmer & Ricardo Vazquez
$(document).ready ->

  doStuffWithPhotos = (photos) ->
    $.each photos, (index, photo) ->
      photoURL = photo.image_url
      photoImage =
        "<div class='item fade'>
           <div class='caption'>
             <h3>#{photo.name}</h3>
             <p>#{photo.description}</p>
           </div>
          <img src=#{photoURL}  />
        </div>"
      $('.photos').append(photoImage)

  bindEvents = ->
    $("#editors_choice").click ->
      $(this).toggleClass 'active'
      $("#popular").removeClass 'active'
      _500px.api "/photos",
        feature: 'editors',
        image_size: 440
        page: 1
      , (response) ->
        $('.photos').empty()
        doStuffWithPhotos(response.data.photos)

    $("#popular").click ->
      $(this).toggleClass 'active'
      $("#editors_choice").removeClass 'active'
      _500px.api "/photos",
        feature: 'popular',
        image_size: 440
        page: 1
      , (response) ->
        $('.photos').empty()
        doStuffWithPhotos(response.data.photos)

  setPhotoProperties = ->
    $(document).on "dragstart", ".photos .item", (e) ->
      e.preventDefault()

    $(document).on "contextmenu", ".photos .item img", (e) ->
      false

    $(document).on "mouseenter", ".fade", (e) ->
      $(this).find(".caption").fadeIn 250

    $(document).on "mouseleave", ".fade", (e) ->
      $(this).find(".caption").fadeOut 250  

  init = ->
    # Grab 500px API Data
    # TODO: Make this private eventually....
    _500px.init({sdk_key: 'e4671f3b61a876dfe887c5031b43d3dd900b63ce'})
    _500px.api "/photos",
      feature: 'popular',
      image_size: 440
      page: 1
    , (response) ->
      doStuffWithPhotos(response.data.photos)

    bindEvents()
    setPhotoProperties()

  init()
