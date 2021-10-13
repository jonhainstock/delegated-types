class Event < ApplicationRecord
	include Creator
	include Requested
	
	belongs_to :recording, required: false
	belongs_to :recordable, polymorphic: true
  belongs_to :recordable_previous, polymorphic: true, optional: true
	
	validates_presence_of :action

	def details
		@details ||= detail.with_indifferent_access[:particulars]
	end
end
