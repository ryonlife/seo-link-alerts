# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_link_alert_session',
  :secret      => '828f6c013751b31c31fdd32cd6753a40a5193fac0d740beb6735a114ea5aa89adb6fb699167e1b7ba41b58e803fea3032db2ecc8dac23dffa23710853dab84b2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
