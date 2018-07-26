class Product < ApplicationRecord
  belongs_to:categeory
  has_and_belongs_to_many:orders
  belongs_to:cart,optional: :true
  
  mount_uploader :product_image, ImageUploader

end
