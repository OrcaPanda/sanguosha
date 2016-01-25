class AddPaperclipToCard < ActiveRecord::Migration
  def change
 	add_attachment :cards, :secondaryimage
  end
end
