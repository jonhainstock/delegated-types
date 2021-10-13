module Creator
  extend ActiveSupport::Concern

  included do
    belongs_to :creator, class_name: 'User', default: -> { Current.user }
  end
end