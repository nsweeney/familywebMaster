class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  # below line we added to set up db relationship
  belongs_to :user   
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 2 }
end
