require 'spec_helper'

describe Feed do
  before(:each) do
    @valid_attributes = {
      :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13479364529815066233'
    }
  end

  it "should create a new instance given valid attributes" do
    Feed.create!(@valid_attributes)
  end
  
  # it "should require url" do
  #   Feed.create!(@valid_attributes.except(:url))
  # end
  # 
  # it "should require domain" do
  #   Feed.create!(@valid_attributes.except(:domain))
  # end
end
