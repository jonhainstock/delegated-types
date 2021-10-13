module Recordable
  extend ActiveSupport::Concern

  included do
    has_one :recording, as: :recordable, autosave: true

    default_scope { includes(:recording) }
    scope :active, -> { where.not(recordings: { status: ["archived", "trashed"] }) }
  end
end