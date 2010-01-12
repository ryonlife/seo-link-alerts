class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :crawls, :dependent => :destroy 
  has_many :alerts, :dependent => :destroy 
  
  # before_save :add_user_id
  # def add_user_id
  #   self.user_id = current_user
  # end

end
