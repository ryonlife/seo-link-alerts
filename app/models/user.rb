class User < ActiveRecord::Base
  acts_as_authentic
  has_many :feeds, :dependent => :destroy
  has_many :domains, :dependent => :destroy
  has_many :alerts, :dependent => :destroy
  serialize :blacklist
  after_save :blacklist_purge, :if => :blacklist_changed?
  after_save :min_mozrank_purge, :if => :min_mozrank_changed?
  
  def blacklist_purge
    puts "blacklist"
  end
  
  def min_mozrank_purge
    puts "min_mozrank"
  end

  protected

  def blacklist_textarea
    self.blacklist.join("\n")
  end

end