class FixTypoInColumnName < ActiveRecord::Migration
  def change
  	rename_column "answers", "corrent", "correct"
  end
end
