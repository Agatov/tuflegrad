class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :image
      t.string :address
      t.string :location
      t.string :phone
      t.string :schedule_weekdays
      t.string :schedule_weekend

      t.timestamps
    end
  end
end
