class DetailsController < ApplicationController
  respond_to :json

  def index
    @details = Detail.where(chapter_id: params[:chapter_id], user_id: current_user.id)

    respond_with @details || ""
  end

  def show
    @detail = Detail.where(chapter_id: params[:chapter_id], id: params[:id])
    @chapter = chapter.find(params[:chapter_id])
    respond_with @chapter, @detail
  end

  def audio

    tempfile = Tempfile.new("123.wav", "#{Rails.root.to_s}/tmp/")
    tempfile.binmode
    tempfile << request.body.read
    tempfile.close

    # audio_params = params.slice(:chapter_id).merge(:tempfile => tempfile)
    # audio = ActionDispatch::Http::UploadedFile.new(audio_params)

    @detail = Voicedetail.create()
    @detail.user = current_user
    @detail.voice = params[:filename]
    # respond_to do |format|
    #   if @detail.save
    #     format.json { head :ok }
    #   else
    #     format.json { render :json => @detail.errors, :status => :unprocessable_entity }
    #   end
    # end

  end

  def create
    # debugger
    @chapter = Chapter.find(params[:chapter_id])

    if params[:detail][:type] == "Photodetail"
      @detail = Photodetail.create(params[:detail])
    else

      @detail = Detail.create(params[:detail])
    end

    # @wish.type = params[:type]
    @detail.chapter = @chapter
    @detail.user = current_user
    @detail.save!
    respond_with  @chapter, @detail

  end

  def update
    respond_with Detail.update(params[:id], params[:detail])
  end

  def destroy
    respond_with Detail.destroy(params[:id])
  end
end