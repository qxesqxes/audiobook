class Audiobook.Views.StoryShow.PhotoDetail extends Backbone.View

  template: JST['stories/show/chapter/photoDetail']
  tagName: 'li'

  events:
    'click .remove_detail': 'removeDetail'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->    
    $(@el).html(@template(detail: @model))
    this

  removeDetail: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
