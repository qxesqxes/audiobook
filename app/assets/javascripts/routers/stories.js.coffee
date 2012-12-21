class Audiobook.Routers.Stories extends Backbone.Router
  routes:
    '': 'root'
    'stories/:id': 'storyShow'
    'stories': 'index'
    'users/:id': 'userShow'

  initialize: ->
    @stories = new Audiobook.Collections.Stories()
    @stories.fetch({async:false})
    console.log @stories
    #Keep fixisible to create a new story
    storyNew = new Audiobook.Models.Story()
    @storiesNewView = new Audiobook.Views.StoriesNew({model: storyNew})
    $('#new_story_container').html(@storiesNewView.render().el)

  root: ->


  index: ->
    # view = new Audiobook.Views.StoriesIndex(collection: @collection)
    # $('#container').html(view.render().el)
    # console.log @collection

  storyShow: (id) ->
    # story = new Audiobook.Models.Story({id: id})
    # story.fetch
    #   success: (data) ->
    #     storyView = new Audiobook.Views.StoriesShow({model: data})
    #     $('#container').html(storyView.render().el)
    #     console.log (data.get("name"))
    @storyShowView = new Audiobook.Views.StoryShow({model: @stories.get(id)})
    $('.container').html(@storyShowView.render().el)


  userShow: (id) ->
    @userShowView = new Audiobook.Views.UserShow({collection: @stories})
    $('.user_container').html(@userShowView.render().el)
    # storiesIndexView = new Audiobook.Views.StoriesIndex({collection: @stories})
    # $('.stories_container').html(storiesIndexView.render().el)