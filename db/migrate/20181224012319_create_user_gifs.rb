class CreateUserGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_gifs do |t|
    	t.integer :user_id 
    	t.integer :gif_id
    end
  end
end
