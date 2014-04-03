class Admin::Message < ActiveRecord::Base
  attr_accessible :email, :msg, :name
end
