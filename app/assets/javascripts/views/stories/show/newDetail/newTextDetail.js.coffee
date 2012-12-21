class Audiobook.Views.StoryShow.NewDetail.NewTextDetail extends Backbone.View

  template: JST['stories/show/newDetail/newTextDetail']

  events:
    'click #submit_new_textdetail': 'submitTextDetail'
  
  initialize: ->
    @collection.on('add', @updateSelect, this)
    @collection.on('remove', @updateSelect, this)

  updateSelect: =>
    @$('#new_textdetail_chapter').html("")
    @collection.forEach (chapter) ->
      @$('#new_textdetail_chapter').append("<option value=" + chapter.id + ">" + chapter.get('name') + "</option>")

  submitTextDetail: (e) ->
    e.preventDefault()
    chapter_id = @$('#new_textdetail_chapter').val()
    attributes = 
      description: @$('#new_textdetail_description').val()
      type: "Textdetail"
      chapter_id: chapter_id
    console.log attributes
    @collection.get({id:chapter_id}).details.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        # location.reload()
      error: (story, msg) ->
        alert "error: " + msg


  render: ->
    $(@el).html(@template(chapters:@collection))
    @updateSelect
    this

