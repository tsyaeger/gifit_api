class AddIndexToUserGifs < ActiveRecord::Migration[5.2]
  def change
    add_index :user_gifs, :user_id
    add_index :user_gifs, :gif_id
  end
end
