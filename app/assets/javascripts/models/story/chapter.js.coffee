class Audiobook.Models.Story.Chapter extends Backbone.Model
  initialize: (attrs, options)->
    this.story_id = options.story_id
    @details = new Audiobook.Collections.Stories.Details({}, {chapter_id: this.id})

  
  	
  validate: (attrs) ->
    if (attrs.name == "")
      return "name can't be blank"