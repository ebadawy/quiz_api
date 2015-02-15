class Question < ActiveRecord::Base
	has_many :choices
	belongs_to :quiz
	belongs_to :user
	belongs_to :Questions
end
