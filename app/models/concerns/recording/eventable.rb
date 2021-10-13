module Recording::Eventable
	extend ActiveSupport::Concern

	included do
		has_many :events, dependent: :destroy

		after_create :track_created
		after_update :track_updated
	end

	def track_event(action, recordable_previous: nil, **particulars)
		Event.create!( 
			action: action,
			recording: self, 
			recordable: recordable, 
			recordable_previous: recordable_previous, 
			creator: Current.user,
			detail: Event::Detail.new(particulars)
		)
	end

	def track_archived_event
		track_event(:achived)
	end

	def track_trashed_event
		track_event(:trashed)
	end

	private 
		
		def track_created
			track_event(:created, status_was: status)
		end

		def recordable_was
			return nil unless recordable_id_previously_changed?
			recordable_type.classify.constantize.find_by_id(recordable_id_previously_was)
		end

		def particulars
			{}.tap do |h|
				h[:status_was] = status
			end
		end

		def track_updated
			return unless previous_changes.slice(:status).any? || recordable_was
			track_event(:updated, recordable_previous: recordable_was, **particulars)
		end
end