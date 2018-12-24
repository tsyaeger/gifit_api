class CreateGifMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :gif_messages do |t|
    	t.integer :gif_id 
    	t.integer :message_id
    end
  end
end
