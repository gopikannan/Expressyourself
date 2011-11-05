class CreateDataSets < ActiveRecord::Migration
  def change
    create_table :data_sets do |t|
      t.integer :poll_id
      t.integer :date
      t.text :poll_data, :limit => 100.kilobyte

      t.timestamps
    end
  end
end
