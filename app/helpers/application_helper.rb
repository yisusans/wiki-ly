module ApplicationHelper
include SessionsHelper

  def redirect_to_login
    redirect_to '/login' unless logged_in?
  end

end
