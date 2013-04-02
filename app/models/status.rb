class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  # below line we added to set up db relationship
  belongs_to :user   
end
