class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :about_company

      t.timestamps
    end
  end
end
