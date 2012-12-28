class Audiobook.Views.StoryShow extends Backbone.View

  template: JST['stories/show']
  className: 'story_show'

  events:
    'click #add_participant': 'addParticipant'   
    'click #add_chapter': 'addChapter'


  initialize: ->
    @model.participants.fetch({async:false})
    @model.chapters.fetch({async:false})

    @model.participants.on("add", @appendParticipant, this)
    @model.participants.on("reset", @render, this)        
    @model.chapters.on("add", @appendChapter, this)
    @model.chapters.on("reset", @render, this)

  render: ->
    $(@el).html(@template(story: @model))
    @model.participants.each(@appendParticipant)    
    @model.chapters.each(@appendChapter)
    newChapterView = new Audiobook.Views.StoryShow.NewChapter({collection: @model.chapters})        
    newDetailView = new Audiobook.Views.StoryShow.NewDetail({collection: @model.chapters})    
    @$('.addContent').append(newChapterView.render().el)
    @$(".addContent").append(newDetailView.render().el)

    this

 
  appendParticipant: (participant) =>
    # console.log participant
    participantView = new Audiobook.Views.StoryShow.Participant(model: participant)
    @$('.participants').append(participantView.render().el)

  appendChapter: (chapter) =>
    chapterView = new Audiobook.Views.StoryShow.Chapter(model: chapter)
    @$('.chaptersContent').append(chapterView.render().el)  

  addChapter: (e) ->
    @$('#create_chapter_detail_modal').modal('toggle')

  addParticipant: (e) ->
    e.preventDefault()
    participants = @model.participants

    FB.ui
      method: "apprequests"
      message: " should learn more about this awesome site."
      data: "extra data"
    ,(sendlist) ->
      if sendlist? and sendlist.to and sendlist.to.length > 0
        sendlist.to.forEach (uid) ->
          FB.api "/" + uid, (user) ->
            FB.api "/" + uid + "/picture", (user_picture) ->
              console.log user_picture
              unless participants.hasUser({ uid: user["id"] })
                participants.create
                  user:
                    uid: user["id"]
                    name: user["name"]
                    picture: user_picture.data.url
                    provider: "facebook"




