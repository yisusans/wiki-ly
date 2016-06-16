class MembershipsController < ApplicationController

  def create
    @membership = Membership.new(group_id: params[:group_id],
                                 user_id: current_user.id
                                 role: "member")
    if @membership.save
      flash[:message] = "Membership is pending based on admin approval."
    else
      flash[:error] = @membership.errors.full_messages
      render '/groups/show'
    end
  end

private

end

