class Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetails extends Backbone.View
  template: JST['stories/show/newDetail/newFBPhotoDetails']

  events:
    # 'click #submit_new_fbphotowish': 'submitFBPhotoWish'
    'change select' : 'selectAlbum'

  render: ->
    $(@el).html(@template())
    FB.api "/me?fields=albums.limit(500).fields(name)", (res) ->
      console.log res
      res.albums["data"].forEach (album) ->
        $('#fb_album').append('<option value="'+album["id"]+'">'+album["name"]+'</option>')
        # $('#fb_album').chosen()
    this

  selectAlbum: ->
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    FB.api "/" + $('#fb_album').val() + "?fields=photos.limit(500).fields(picture,id)", (res) ->
      console.log res
      $('#fb_preview').html('')
      $('#fb_preview').text('no photos QAQ') unless res.photos
      res.photos["data"].forEach (photo) ->
        view = new Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetail({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)
