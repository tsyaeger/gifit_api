class AddIndexToGifMessages < ActiveRecord::Migration[5.2]
  def change
    add_index :gif_messages, :gif_id
    add_index :gif_messages, :message_id
  end
end
