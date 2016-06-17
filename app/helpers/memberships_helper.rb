module MembershipsHelper
include ApplicationHelper


private

  def member_already?
    !(memberships.where(user_id: current_user.id).empty?)
  end

  def memberships
    group_memberships = @group.memberships
  end

end
