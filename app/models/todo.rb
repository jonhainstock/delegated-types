class Todo < ApplicationRecord
	include Recordable

	validates_presence_of :content
end
