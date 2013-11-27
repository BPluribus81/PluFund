# Be sure to restart your server when you modify this file.
require 'securerandom'
# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
def find_secure_token
  ::Configuration[:secret_token] = SecureRandom.hex(64) unless ::Configuration[:secret_token]
  ::Configuration[:secret_token]
rescue
  # Just to ensure that we can run migrations and create the configurations table
  nil
end

def find_secure_key_base
  ::Configuration[:secret_key_base] = SecureRandom.hex(64) unless ::Configuration[:secret_key_base]
  ::Configuration[:secret_key_base]
rescue
  # Just to ensure that we can run migrations and create the configurations table
  nil
end

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Catarse::Application.config.secret_token = ENV['SECRET_TOKEN']
Catarse::Application.config.secret_key_base = secure_token
