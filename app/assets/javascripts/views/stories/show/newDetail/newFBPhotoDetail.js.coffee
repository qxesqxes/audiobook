class Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetail extends Backbone.View

  template: JST['stories/show/newDetail/newFBPhotoDetail']
  tagName: 'span'

  events:
    'click img': 'selectPhoto'

  initialize: (options)->
    @wishes = options.collection


  selectPhoto: (e) ->
    e.preventDefault()
    console.log @wishes
    attributes = 
      pid: @model.id
      type: "Fbphotowish"
      chapter_id: @wishes.chapter_id
    @wishes.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        # location.reload()
      error: (story, msg) ->
        alert "error: " + msg

  render: ->
    $(@el).html(@template(photo: @model))
    this

  close: =>
    this.remove()
    this.unbind()
