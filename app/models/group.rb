class Group < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many  :quizzes

	@group_users
	@groups
	
	def get
		@groups
	end 
	def add_group_users users
		{id: self.id, group_name: self.group_name,
			students_number: self.students_number, 
			users: users}
	end

end
