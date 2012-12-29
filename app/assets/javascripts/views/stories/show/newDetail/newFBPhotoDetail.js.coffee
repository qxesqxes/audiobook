class Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetail extends Backbone.View

  template: JST['stories/show/newDetail/newFBPhotoDetail']
  tagName: 'span'

  events:
    'click img': 'selectPhoto'

  initialize: (options)->
    @chapters = options.collection


  selectPhoto: (e) ->
    e.preventDefault()

    chapter_id = $('#new_FBphotodetail_chapter').val()
    attributes = 
      pid: @model.id
      type: "Fbphotodetail"
      chapter_id: chapter_id

    @chapters.get({id:chapter_id}).details.create attributes,
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
