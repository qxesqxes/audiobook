class Voicedetail < Detail

  attr_accessible :name, :voice
  mount_uploader :voice, VoiceUploader

end