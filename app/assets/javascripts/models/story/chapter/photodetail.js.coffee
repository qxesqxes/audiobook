class Audiobook.Models.Story.PhotoDetail extends Backbone.Model
  initialize: (attrs, options) ->
    this.chapter_id = attrs.chapter_id

  urlRoot: ->
    '/api/chapters/' + this.chapter_id + '/details'