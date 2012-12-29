class Audiobook.Views.StoryShow.NewDetail.NewPhotoDetail extends Backbone.View

  template: JST['stories/show/newDetail/newPhotoDetail']

  events:
    'click #submit_new_photodetail': 'submitPhotoDetail'

  initialize: ->
    @collection.on('add', @updateSelect, this)
    @collection.on('remove', @updateSelect, this)

  updateSelect: =>
    @$('#new_photodetail_chapter').html("")
    @collection.forEach (chapter) ->
      @$('#new_photodetail_chapter').append("<option value=" + chapter.id + ">" + chapter.get('name') + "</option>")


  submitPhotoDetail: (e) ->
    e.preventDefault()
    chapter_id = @$('#new_photodetail_chapter').val()
    formData = new FormData($('#add_photodetail_form')[0])
    console.log formData
    formData.append('detail[description]', 'lalala')
    formData.append('detail[type]', 'Photodetail')

    $.ajax
      url: '/api/chapters/' + chapter_id + '/details',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: (data) ->
        location.reload()
        

  render: ->
    $(@el).html(@template(chapters:@collection))
    @updateSelect
    this

