require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV["aws_access_id"],
    aws_secret_access_key: ENV["aws_access_secret_key"],
  }
  config.fog_directory  = "myavatars"
end
