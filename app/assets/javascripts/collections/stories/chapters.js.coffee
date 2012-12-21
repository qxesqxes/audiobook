class Audiobook.Collections.Stories.Chapters extends Backbone.Collection
  model: Audiobook.Models.Story.Chapter

  initialize: (attrs, options) -> 
    this.story_id = options.story_id

  url: ->
    '/api/stories/' + this.story_id + '/chapters'
    