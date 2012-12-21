class ChaptersController < ApplicationController
  respond_to :json  

  def index
    @chapters = Chapter.where(story_id: params[:story_id])
    respond_with @chapters
  end

  def show
    @chapter = Chapter.where(story_id: params[:story_id], id: params[:id])
    @story = Story.find(params[:story_id])
    respond_with @story, @chapter
  end  

  def create
    # debugger
    @story = Story.find(params[:story_id])
    @chapter = Chapter.create(params[:chapter])

    # @wish.type = params[:type]
    @chapter.story = @story

    @chapter.save!
    respond_with  @story, @chapter

  end

  def update
    respond_with Chapter.update(params[:id], params[:chapter])
  end

  def destroy
    respond_with Chapter.destroy(params[:id])
  end
end