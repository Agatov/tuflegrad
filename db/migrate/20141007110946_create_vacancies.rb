class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.integer :salary_min
      t.integer :salary_max
      t.string :experience
      t.string :schedule
      t.text :description
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
