class Audiobook.Models.Story.Participant extends Backbone.Model

  initialize: (attrs, options)->
    this.story_id = options.story_id

    this.on("change:user", this.parseUser)
    this.parseUser()

  parseUser: ->
    return unless this.get('user')
    @user = this.get('user')



