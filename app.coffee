# 500px Hack Day Project
# May 24, 2013
# Created by: Marc Bodmer
$(document).ready -> 

  doStuffWithPhotos = (photos) ->
    $.each photos, (index, photo) ->
      console.log index
      console.log photo
      console.log '-------'
      photoURL = photo.image_url
      photoImage = "<img src=\" " + photoURL + "\"/>"
      $('#photos').append(photoImage)

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

  init()  