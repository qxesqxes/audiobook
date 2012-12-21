class Audiobook.Models.Story.TextDetail extends Backbone.Model
  initialize: (attrs, options) ->
    this.chapter_id = attrs.chapter_id
  
  urlRoot: ->
    '/api/chapters/' + this.chapter_id + '/details'

  validate: (attrs) ->
    if (attrs.description == "")
      return "來些文字記錄吧!"
