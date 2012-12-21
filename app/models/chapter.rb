class Chapter < ActiveRecord::Base
  attr_accessible :name, :story_id
  has_many :details
  belongs_to :story
end
