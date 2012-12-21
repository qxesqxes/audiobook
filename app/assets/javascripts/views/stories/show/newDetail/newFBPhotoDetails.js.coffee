class Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetails extends Backbone.View
  template: JST['stories/show/newDetail/newFBPhotoDetails']

  render: ->
    $(@el).html(@template())
    FB.api "/me?fields=albums.limit(500).fields(name)", (res) ->
      console.log res
      res.albums["data"].forEach (album) ->
        $('#fb_album').append('<option value="'+album["id"]+'">'+album["name"]+'</option>')
        # $('#fb_album').chosen()
    this
