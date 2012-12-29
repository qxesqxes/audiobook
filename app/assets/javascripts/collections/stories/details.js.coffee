class Audiobook.Collections.Stories.Details extends Backbone.Collection
  
  model: (attrs, options) =>
    switch attrs.type      
      when 'Textdetail' then new Audiobook.Models.Story.TextDetail(attrs, options)
      when 'Photodetail' then new Audiobook.Models.Story.PhotoDetail(attrs, options)
      when 'Fbphotodetail' then new Audiobook.Models.Story.FBPhotoDetail(attrs, options)
      # else new WishPlus.Models.Story.Wish(attrs, options)
      else new Backbone.Model

  initialize: (models, options) -> 
    this.chapter_id = options.chapter_id
  

  url: ->
    '/api/chapters/' + this.chapter_id + '/details'


