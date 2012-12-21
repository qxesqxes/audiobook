class Audiobook.Views.StoryShow.NewDetail.NewVoiceDetail extends Backbone.View

  template: JST['stories/show/newDetail/newVoiceDetail']

  events:
    'click #submit_new_voicedetail': 'submitVoiceDetail'
    'click #recorderUI.reset #controlButton': 'reset'
    'click #recorderUI.recording #controlButton, #recorderUI.playing #controlButton': 'recorded'
    'click #recorderUI.recorded #controlButton': 'playing'
    'click #reset': 'stop'
    'click #upload': 'upload'

  initialize: ->
    @SC = SC
    @SC.initialize
      client_id: 'cfe315d1ab2366bec99016fe6589219f',
      redirect_uri: 'http://localhost:3000/soundcloud/callback'

  reset: (e) =>
    @updateTimer 0
    self = this
    @SC.record
      start: ->
        self.setRecorderUIState "recording"

      progress: (ms, avgPeak) ->
        self.updateTimer ms

    e.preventDefault()

  recorded: (e) ->
    @setRecorderUIState "recorded"
    @SC.recordStop()
    e.preventDefault()

  playing: (e) =>
    @updateTimer 0
    @setRecorderUIState "playing"
    self = this
    @SC.recordPlay
      progress: (ms) ->
        self.updateTimer ms

      finished: ->
        self.setRecorderUIState "recorded"

    e.preventDefault()

  stop: (e) ->
    @SC.recordStop()
    @setRecorderUIState "reset"
    e.preventDefault()

  upload: (e) ->
    @setRecorderUIState "uploading"
    @SC.connect connected: ->
      $("#uploadStatus").html "Uploading..."
      SC.recordUpload
        track:
          title: "Untitled Recording"
          sharing: "private"
      , (track) ->
        console.log track
        $("#uploadStatus").html "Uploaded: <a href='" + track.permalink_url + "'>" + track.permalink_url + "</a>"


    e.preventDefault()


  updateTimer: (ms) =>
    @$("#timer").text SC.Helper.millisecondsToHMS(ms)

  setRecorderUIState: (state) =>
    @$("#recorderUI").attr "class", state





  submitVoiceDetail: (e) ->
    e.preventDefault()
    # attributes = 
    #   description: @$('#new_textdetail_description').val()
    #   type: "Textdetail"
    #   story_id: @collection.story_id
    # console.log attributes
    # @collection.create attributes,
    #   wait:true
    #   success: (story) ->
    #     # window.location.assign('/stories/' + story.id )
    #     # location.reload()
    #   error: (story, msg) ->
    #     alert "error: " + msg


  render: ->
    $(@el).html(@template())
    this

