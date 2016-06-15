class MembershipsController < ApplicationController

  def create
    if logged_in?
      @membership = Membership.create(group_id: )
    end
  end

end
