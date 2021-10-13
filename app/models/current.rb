class Current < ActiveSupport::CurrentAttributes
  attribute :user, :request_id, :user_agent, :ip_address

  def user=(value)
    super
  end
end