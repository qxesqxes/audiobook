class Photodetail < Detail

  attr_accessible :name, :photo, :remote_photo_url
  mount_uploader :photo, PhotoUploader

end