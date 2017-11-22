require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
 CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['SECRET_ACCESS_KEY'],
        :region                => 'us-east-1',
    }

    config.fog_directory = 'cosme-picture-board'
    config.fog_public = true
  end
else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end