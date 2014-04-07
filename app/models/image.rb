class Image < ActiveRecord::Base
  belongs_to :product
  attr_accessible :content, :index, :path, :product_id
end
