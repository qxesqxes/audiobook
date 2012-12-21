class Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetails extends Backbone.View
  template: JST['stories/show/newDetail/newFBPhotoDetails']

  render: ->
    $(@el).html(@template())
    this
