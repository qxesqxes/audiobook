class Audiobook.Views.StoryShow.Chapter extends Backbone.View
  template: JST['stories/show/chapter']
  className: 'story_chapter'

  events:
    'dblclick .chapter_name': 'changeName'
    'click .remove_chapter': 'removeChapter'
    'click li img': 'carouselModal'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)
    @model.details.fetch({async:false})
    @model.details.on("add", @appendDetail, this)
    @model.details.on("reset", @render, this)

  render: ->  
    $(@el).html(@template(chapter: @model))      
    @model.details.each(@appendDetail)    
    this     

  appendDetail: (detail) =>
    view
    switch detail.get("type")
      when 'Textdetail' then view = new Audiobook.Views.StoryShow.TextDetail(model: detail)
      when 'Photodetail' then view = new Audiobook.Views.StoryShow.PhotoDetail(model: detail)
      when 'Fbphotodetail' then view = new Audiobook.Views.StoryShow.FBPhotoDetail(model: detail)
    @$('#details-'+@model.id).append(view.render().el)

  changeName: (e) ->
    

  removeChapter: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)

  carouselModal: (e) ->
    @$('#myFBModal').modal('toggle')


