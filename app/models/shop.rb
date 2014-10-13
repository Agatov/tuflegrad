class Shop < ActiveRecord::Base

  mount_uploader :image, ShopImageUploader
end
