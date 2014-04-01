class Product < ActiveRecord::Base
  has_many :images
  has_one :catalog
  attr_accessible :catalog_id, :desc, :introduce, :name, :shortdesc
end
