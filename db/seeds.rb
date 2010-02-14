# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# http://asciicasts.com/episodes/179-seed-data

user = User.create!(
  :username => 'workingpoint',
  :email => 'rmckillen@workingpoint.com',
  :password => 'workingpoint1',
  :password_confirmation => 'workingpoint1'
)
Domain.create!(
  :user_id => user.id,
  :name => 'blinksale.com'
)
Feed.create!(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13479364529815066233'
)
Domain.create(
  :user_id => user.id,
  :name => 'clarityaccounting.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/14483086467735945816'
)
Domain.create(
  :user_id => user.id,
  :name => 'freeagentcentral.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/9052846273680508133'
)
Domain.create(
  :user_id => user.id,
  :name => 'freshbooks.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/821401960719390402'
)
Domain.create(
  :user_id => user.id,
  :name => 'getballpark.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/17500597487404998314'
)
Domain.create(
  :user_id => user.id,
  :name => 'getharvest.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13289910584060414974'
)
Domain.create(
  :user_id => user.id,
  :name => 'intuit.com'
)
Feed.create(
  :user_id => user.id,  
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/2337650881512061'
)
Domain.create(
  :user_id => user.id,
  :name => 'outright.com'
)
Feed.create(
  :user_id => user.id,  
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13544752635861414129'
)
Domain.create(
  :user_id => user.id,
  :name => 'xero.com'
)
Feed.create(
  :user_id => user.id,
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/811024738914585518'
)
Domain.create(
  :user_id => user.id,
  :name => 'zoho.com'
)
Feed.create(
  :user_id => user.id,  
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/10614922649383398045'
)