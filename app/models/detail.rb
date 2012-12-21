class Detail < ActiveRecord::Base
  attr_accessible :description, :name, :photo, :remote_photo_url, :story_id, :type, :user_id, :voice, :chapter_id

  belongs_to :story
  belongs_to :chapter
  belongs_to :user

end
