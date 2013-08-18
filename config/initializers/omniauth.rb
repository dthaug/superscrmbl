Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '280634932039390', '9275c2c3775a0a7e9b0725de219ab3d5'
end