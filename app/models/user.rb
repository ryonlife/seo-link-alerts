class User < ActiveRecord::Base
  acts_as_authentic
  has_many :feeds, :dependent => :destroy
  has_many :domains, :dependent => :destroy
  has_many :alerts, :dependent => :destroy
end
