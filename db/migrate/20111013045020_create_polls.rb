class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :user_id
      t.string :question
      t.string :option1
      t.string :option2
      t.integer :status

      t.timestamps
    end
  end
end
