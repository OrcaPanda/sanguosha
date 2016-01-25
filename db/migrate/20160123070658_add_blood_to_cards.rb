class AddBloodToCards < ActiveRecord::Migration
  def change
	add_column :cards, :blood, :float, :default => 3
	add_column :cards, :gamemode, :string, :default => "sanguosha"
  end
end
