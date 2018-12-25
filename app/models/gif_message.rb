class GifMessage < ApplicationRecord
	belongs_to :gif 
	belongs_to :message
end
