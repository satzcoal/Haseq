class PageContent < ActiveRecord::Base
  has_one :image
  attr_accessible :content, :image_id, :index, :title
end
