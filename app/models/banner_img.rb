class BannerImg < ActiveRecord::Base
  validates :path, :presence => true
  attr_accessible :content, :nindex, :path
end
