# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_S8Calc_session',
  :secret      => '11742a759fb33ff9a71f2075e482fe227ceb2cfad037ef495a7c2ca66afe575b9efd328cf64d180c2d9d9c30260ec4cd2d0b49dfbb9c17f96de992478cd42f26'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
