class Admin::BaseController < ApplicationController
  before_action :require_authorization

  def require_authorization
    if !current_user.nil?
      if current_user.admin?
        true
      end
    else
      redirect_to login_path
    end
  end
end
