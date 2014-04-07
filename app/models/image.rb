class Image < ActiveRecord::Base
  belongs_to :product
  attr_accessible :content, :nindex, :path, :product_id
end
