class ApplicationController < ActionController::Base
  protect_from_forgery


  def get_current_account
    @account = current_account
  end
end
