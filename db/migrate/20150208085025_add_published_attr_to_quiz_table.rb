class AddPublishedAttrToQuizTable < ActiveRecord::Migration
  def change
  	add_column "quizzes", "published", :boolean
  end
end
