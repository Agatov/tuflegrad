class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.text :reply
      t.boolean :moderated, default: 0

      t.timestamps
    end
  end
end
