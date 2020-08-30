class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["hirohiroki"] && password == ENV["6521"]
    end
  end

end
