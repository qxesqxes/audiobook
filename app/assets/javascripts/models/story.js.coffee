class Audiobook.Models.Story extends Backbone.Model
  urlRoot: ->
    '/api/stories/'
  

  initialize: ->
    @participants = new Audiobook.Collections.Stories.Participants({}, {story_id: this.id})
    # @details = new Audiobook.Collections.Stories.Details({}, {story_id: this.id})
    @chapters = new Audiobook.Collections.Stories.Chapters({}, {story_id: this.id})
    # this.participants.fetch({async:false})

  validate: (attrs) ->
    if (attrs.name == "")
      return "name can't be blank"




