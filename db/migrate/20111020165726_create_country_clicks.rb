class CreateCountryClicks < ActiveRecord::Migration
  def change
    create_table :country_clicks do |t|
      t.integer :poll_id
      t.string :country
      t.integer :clicks
      t.integer :date

      t.timestamps
    end
  end
end
