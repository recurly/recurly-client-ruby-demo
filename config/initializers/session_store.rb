# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_recurly-client-app-ruby_session',
  :secret      => '5eb64ece0944afd1fc4131c9e8963143b5ad1b803ff9ca39d446aa85271e5925ca6a31f7765e37c405e1ecb67730a725b3e081dd85d550cce3147ae3f04c17b9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
