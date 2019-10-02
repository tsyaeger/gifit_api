class AddPositionToGifMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :gif_messages, :position, :integer
  end
end
