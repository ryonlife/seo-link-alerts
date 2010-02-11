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

Feed.create!(
  :user_id => user.id,
  :domain => 'blinksale.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13479364529815066233'
)

Feed.create(
  :user_id => user.id,
  :domain => 'clarityaccounting.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/14483086467735945816'
)

Feed.create(
  :user_id => user.id,
  :domain => 'freeagentcentral.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/9052846273680508133'
)

Feed.create(
  :user_id => user.id,
  :domain => 'freshbooks.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/821401960719390402'
)

Feed.create(
  :user_id => user.id,
  :domain => 'getballpark.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/17500597487404998314'
)

Feed.create(
  :user_id => user.id,
  :domain => 'getharvest.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13289910584060414974'
)

Feed.create(
  :user_id => user.id,
  :domain => 'intuit.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/2337650881512061'
)

Feed.create(
  :user_id => user.id,
  :domain => 'outright.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/13544752635861414129'
)

Feed.create(
  :user_id => user.id,
  :domain => 'xero.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/811024738914585518'
)

Feed.create(
  :user_id => user.id,
  :domain => 'zoho.com',
  :url => 'http://www.google.com/alerts/feeds/15340011665024776864/10614922649383398045'
)