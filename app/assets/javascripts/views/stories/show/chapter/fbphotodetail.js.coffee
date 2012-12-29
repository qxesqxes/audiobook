class Audiobook.Views.StoryShow.FBPhotoDetail extends Backbone.View

  template: JST['stories/show/chapter/fbphotoDetail']
  tagName: 'li'

  events:
    'click .remove_detail': 'removeDetail'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    self = this 
    FB.api '/' + @model.get("pid") + '?fields=source,link', (res) ->      
      $(self.el).html(self.template({res: res}))

    this

  removeDetail: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
