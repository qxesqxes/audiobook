class Audiobook.Views.StoriesIndex extends Backbone.View
  template: JST['stories/index']
  className: 'span3'
  tagName: 'li'

  events:
    'click .remove_story': 'removeStory'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)
  
  render: ->	  	
    $(@el).html(@template(story: @model))  	    
    this 	

  removeStory: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)