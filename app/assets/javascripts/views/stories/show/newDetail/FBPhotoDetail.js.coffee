class Audiobook.Views.StoryShow.NewDetail.FBPhotoDetail extends Backbone.View
  template: JST['stories/show/newDetail/FBPhotoDetail']

  tagName: 'span'

  render: ->
    $(@el).html(@template(photo: @model))
    this