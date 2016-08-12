# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :cocktail_profile_pic do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, :crop=>"scale"
  end

  version :cocktail_full_pic do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 300, height: 300, :crop=>"scale"
  end
end
