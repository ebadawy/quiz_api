class Question < ActiveRecord::Base
	has_many :choices
	belongs_to :quiz
end
