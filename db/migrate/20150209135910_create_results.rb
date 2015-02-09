class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :result
      t.integer :user_id
      t.integer :quiz_id

      t.timestamps null: false
    end
  end
end
