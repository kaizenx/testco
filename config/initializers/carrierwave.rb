# config/initializers/carrierwave.rb
if Rails.env.test?

  # make sure our uploader is auto-loaded
  ImageUploader
  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end

end


CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['S3_KEY'],
    :aws_secret_access_key  => ENV['S3_SECRET'],
    :region                 => ENV['S3_REGION']
  }

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
  else
    config.storage = :fog
  end

  config.fog_directory  = ENV['S3_BUCKET']
  config.fog_public     = false
  config.fog_attributes = {}
end
