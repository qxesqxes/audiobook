OmniAuth.config.logger = Rails.logger


if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '404861629573946', '440c91368b73b49e2215f65e47ab0a2a', :display => "popup", scope: "email,publish_stream,user_photos"
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '337290613031125', '166abd279dad36b84f55248cf80a0d9e', :display => "popup", scope: "email,publish_stream,user_photos"
  end
end