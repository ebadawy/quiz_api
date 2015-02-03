class Group < ActiveRecord::Base
	Group has_and_belongs_to_many :users
end
