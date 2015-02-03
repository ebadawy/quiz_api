class User < ActiveRecord::Base
	User has_and_belongs_to_many :groups
end
