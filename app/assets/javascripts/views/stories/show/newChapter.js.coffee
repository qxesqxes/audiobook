class Audiobook.Views.StoryShow.NewChapter extends Backbone.View
  template: JST['stories/show/newChapter']
  className: 'new_chapter_modal'

  events:
    'click #submit_new_chapterdetail': 'submitChapterDetail'

  render: ->
    $(@el).html(@template())
    this

  submitChapterDetail: (e) ->
    e.preventDefault()
    attributes = 
      name: @$('#new_chapterdetail_description').val()
      story_id: @collection.story_id    
    @collection.create attributes,
      wait:true
      success: (story) ->
        $('#create_chapter_detail_modal').modal('toggle')

        # window.location.assign('/stories/' + story.id )
        # location.reload()
      error: (story, msg) ->
        alert "error: " + msg

  