class CompleteTheQuizAttr < ActiveRecord::Migration
  def change
  	add_column "quizzes", "deadline", :string
  	add_column "quizzes", "time_limit", :string
  	add_column "quizzes", "quiz_mark", :int
  end
end
