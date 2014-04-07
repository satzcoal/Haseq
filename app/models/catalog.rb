class Catalog < ActiveRecord::Base
  has_many :products
  attr_accessible :nindex, :name
end
