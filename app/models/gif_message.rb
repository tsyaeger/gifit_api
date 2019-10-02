class GifMessage < ApplicationRecord
	belongs_to :gif 
	belongs_to :message

	default_scope {order(position: :asc)}
end
