class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :poll_id
      t.integer :user_id
      t.integer :option
      t.string :location

      t.timestamps
    end
  end
end
