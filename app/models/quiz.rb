class Quiz < ActiveRecord::Base
	has_many :questions
	belongs_to :user
	belongs_to :group

	def add_result_status published
		{id: self.id, name: self.name, user_id: self.user_id,
		 deadline: self.deadline, time_limit: self.time_limit,
		  quiz_mark: self.quiz_mark,published: self.published,
		   result_published: published}
	end
end
