class Audiobook.Views.StoryShow.NewDetail extends Backbone.View

  template: JST['stories/show/newDetail']
  className: 'addDetails'  

  events:        
    'click #add_photodetail': 'addPhotoDetail'
    'click #add_textdetail': 'addTextDetail'
    'click #add_voicedetail': 'addVoiceDetail'    

  render: ->
    $(@el).html(@template())
    newTextDetailView = new Audiobook.Views.StoryShow.NewDetail.NewTextDetail({collection: @collection})
    newPhotoDetailView = new Audiobook.Views.StoryShow.NewDetail.NewPhotoDetail({collection: @collection})
    newVoiceDetailView = new Audiobook.Views.StoryShow.NewDetail.NewVoiceDetail({collection: @collection})    
    newFBPhotoDetailsView = new Audiobook.Views.StoryShow.NewDetail.NewFBPhotoDetails({collection: @collection})    
    @$('#new_detail_modal').append(newTextDetailView.render().el)
    @$('#new_detail_modal').append(newPhotoDetailView.render().el)
    @$('#new_detail_modal').append(newVoiceDetailView.render().el)
    @$('#new_detail_modal').append(newFBPhotoDetailsView.render().el)
    this  

  addPhotoDetail: (e) ->
    @$('#create_photo_detail_modal').modal('toggle')

  addTextDetail: (e) ->
    @$('#create_text_detail_modal').modal('toggle')

  addVoiceDetail: (e) ->
    @$('#create_voice_detail_modal').modal('toggle')


  removeDetail: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()

