module GroupsHelper

  def admin?
    check_for_admin
  end

  def check_for_admin
    @group.memberships.select do |group|
      group.role == "admin" && group.user.id == current_user.id
    end
  end

end
