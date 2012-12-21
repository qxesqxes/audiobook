class Audiobook.Views.StoryShow.TextDetail extends Backbone.View

  template: JST['stories/show/chapter/textDetail']
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

