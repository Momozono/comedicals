# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end




Fragment::Application.config.secret_key_base = 'c45afdf62c6f76698d449fad6d821b2cde69fa1f0f653de012018b6611f92db57a1bae58067c2f4a2245b4ee33b689caf4d58b6e0b7146bf8a7567ae6ce55436'
