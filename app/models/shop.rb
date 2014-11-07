class Shop < ActiveRecord::Base

  mount_uploader :image, ShopImageUploader
  geocoded_by :full_street_address, lookup: :yandex
  after_validation :geocode

  def full_street_address
    I18n.t 'full_address', {address: address}
  end


end
