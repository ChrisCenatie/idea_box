class User::BaseController < ApplicationController
  before_action :require_authorization

  def require_authorization
    if current_user
      true
    else
      redirect_to login_path
    end
  end
end
