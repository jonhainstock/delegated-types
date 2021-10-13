class Recording < ApplicationRecord
  include Creator
	include Recordables
  include Eventable

	def self.record(recordable, children: nil, parent: nil, creator: Current.user, status: :active, **options)
    transaction do
    	options.merge!(recordable: recordable, parent: parent, status: status, creator: creator)
    	create!(options).tap do |recording|
    		Array(children).each do |child|
          record child, parent: recording, status: status, creator: creator
        end
    	end
    end
  end
end