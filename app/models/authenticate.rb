class Authenticate < ActiveRecord::Base
	has_secure_password 

	def self.create_user(userid,pass)
		new_user = Authenticate.new(username: userid, password: pass )
		new_user.save
	end

	def self.get_user_by_name(user)
		found_user = Authenticate.find_by(username: user)
	end

	def self.get_user_by_id(id)
		found_user = Authenticate.find(id)
	end
end
