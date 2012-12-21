class Audiobook.Views.UserShow extends Backbone.View

  template: JST['users/show']
  className: 'user_show'

  initialize: ->
    @collection.on('reset', @render, this) #when fetch ,it will call reset

  render: ->
    $(@el).html(@template())
    @collection.each(@appendStory)
    this

  appendStory: (story) ->
    view = new Audiobook.Views.StoriesIndex(model: story)    
    $('.thumbnails').append(view.render().el)

  

