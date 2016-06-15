module ApplicationHelper

def redirect_to_login
  redirect to '/sessions/login' unless logged_in?
end

def redirect_unless_admin
  redirect_to '/' unless current_user.id == @user.id
end
end
