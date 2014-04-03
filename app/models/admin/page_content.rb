class Admin::PageContent < ActiveRecord::Base
  has_one :admin_image
  attr_accessible :content, :image_id, :index, :title
end
