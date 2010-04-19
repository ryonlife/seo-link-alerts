# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => "Chicago" }, { :name => "Copenhagen" }])
#   Major.create(:name => "Daley", :city => cities.first)

# http://asciicasts.com/episodes/179-seed-data

user = User.create!(
  :username => "workingpoint",
  :email => "rmckillen@workingpoint.com",
  :password => "workingpoint1",
  :password_confirmation => "workingpoint1",
  :min_metric => 3,
  :blacklist => %w(craigslist.com twitter.com topsy.com xmarks.com tweetmeme.com)
)

Domain.create!(:user_id => user.id, :name => "billingmanager.intuit.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/9717253108151886370")

Domain.create!(:user_id => user.id, :name => "billingorchard.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/13867647443360317376")

Domain.create!(:user_id => user.id, :name => "blinksale.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/9294805335817503065")

Domain.create!(:user_id => user.id, :name => "clarityaccounting.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/7625339246156930865")

Domain.create!(:user_id => user.id, :name => "curdbee.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/12654935965205422895")

Domain.create!(:user_id => user.id, :name => "freeagentcentral.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/18100011966491749718")

Domain.create!(:user_id => user.id, :name => "freshbooks.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/6240208128399490711")

Domain.create!(:user_id => user.id, :name => "getballpark.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/280346136937478714")

Domain.create!(:user_id => user.id, :name => "getcashboard.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/3825729718742795707")

Domain.create!(:user_id => user.id, :name => "getharvest.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/12189778556482473779")

Domain.create!(:user_id => user.id, :name => "iacez.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/9097519455392453694")

Domain.create!(:user_id => user.id, :name => "invoice.zoho.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/8115054993073402131")

Domain.create!(:user_id => user.id, :name => "invotrak.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/12489256938917803372")

Domain.create!(:user_id => user.id, :name => "lessaccounting.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/4712314101666605130")

Domain.create!(:user_id => user.id, :name => "outright.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/1536866210761408646")

Domain.create!(:user_id => user.id, :name => "pulseapp.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/9334385038291964442")

Domain.create!(:user_id => user.id, :name => "quickbooks.intuit.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/3452502418267842910")

Domain.create!(:user_id => user.id, :name => "saasu.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/886509635584835205")

Domain.create!(:user_id => user.id, :name => "simplybill.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/15962192165401507370")

Domain.create!(:user_id => user.id, :name => "xero.com")
Feed.create!(:user_id => user.id, :url => "http://www.google.com/alerts/feeds/15340011665024776864/1451173714449700329")