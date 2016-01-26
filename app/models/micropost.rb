class Micropost < ActiveRecord::Base
    
  # n : 1 = micropost : user
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
