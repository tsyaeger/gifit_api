class CreateMessages < ActiveRecord::Migration[5.2]
  def change
  	create_table :messages do |t| 
  		t.string :header, default: ""
  		t.string :footer, default: ""
  		t.integer :sender_id
  		t.integer :receiver_id
  		t.boolean :sent, default: false
  		t.timestamps null: false
  	end
  end
end
