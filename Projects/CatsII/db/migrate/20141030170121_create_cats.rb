class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description
      t.string :user_id, null: false
      t.timestamps
    end
    add_index :cats, :user_id
  end
end
