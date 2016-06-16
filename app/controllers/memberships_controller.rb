class MembershipsController < ApplicationController
include ApplicationHelper

  def create
    @group = Group.find(params[:group_id])
    @membership = Membership.new(group_id: params[:group_id],
                                 user_id: current_user.id,
                                 role: "member")
    if @membership.save
      flash[:message] = "Thanks for joining #{@group}!"
      redirect_to @group
    else
      flash[:error] = @membership.errors.full_messages
      render '/groups/show'
    end
  end

private

  def member_params
    params.require(:group).permit(:group_id)
  end

end

