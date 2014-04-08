class Product < ActiveRecord::Base
  has_many :images
  belongs_to :catalog
  attr_accessible :catalog_id, :desc, :introduce, :name, :shortdesc, :isshowindex
end
