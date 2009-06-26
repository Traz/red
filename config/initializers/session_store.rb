# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rd_session',
  :secret      => 'e44f8278446450a7a0e829245aac923fa66f9bedd27fe31bbd9dce416fd1eeddc204c1acb90e8405f7c0c407dfed542fd70b8bbc0cb63845a793c5ac570a2690'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
