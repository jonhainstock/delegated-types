class ApplicationController < ActionController::Base
  before_action :set_request_details

  private 
    def set_request_details
      Current.request_id = request.uuid
      Current.user_agent = request.user_agent
      Current.ip_address = request.remote_ip
      Current.user = current_user
    end
end
