# 500px Hack Day Project
# May 24, 2013
# Created by: Marc Bodmer
$(document).ready -> 

  doStuffWithPhoto = ->
    console.log "Here"

  init = ->
    console.log "Welcome to your new vision"

    # Grab 500px API Data
    # TODO: Make this private eventually....
    _500px.init({sdk_key: 'e4671f3b61a876dfe887c5031b43d3dd900b63ce'})
    _500px.api "/photos/search",
      term: "sunny"
      image_size: 3
      page: 1
    , (response) ->
      # Do stuff here
      photoOne = response.data.photos[0]
      photoURL = photoOne.image_url
      photoImage = "<img src=\" " + photoURL + "\"/>"
      # $('#photo').html(photoImage)

      doStuffWithPhoto()

  init()  