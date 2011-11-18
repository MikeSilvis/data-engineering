class Special < ActiveRecord::Base
	belongs_to :purchaser
	belongs_to :store
	
	accepts_nested_attributes_for :purchaser
	accepts_nested_attributes_for :store
end
