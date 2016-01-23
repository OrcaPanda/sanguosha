class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, :cardtype
      t.text :explanation
      t.timestamps null: false
    end
  end
end
