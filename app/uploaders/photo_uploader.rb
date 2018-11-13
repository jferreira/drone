class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # process: :eager
  # version :avatar do
  #   resize :50, :50, gravity: face, crop: fill
  # end

end
