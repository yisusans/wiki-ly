class GroupsController < ApplicationController
include ApplicationHelper

  def index
    @groups = Group.all
    render 'index'
  end

  def new
    redirect_to_login
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @membership = Membership.create( user_id: current_user.id,
                                       role: "admin",
                                       group_id: @group.id )
      redirect_to @group
    else
      @errors = @group.errors.full_messages
      render '/groups/new'
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    if @group
      @group_name = @group.name
      @users = @group.memberships
      @articles = @group.articles
      render '/groups/show'
    else
      redirect '/'
    end
  end

  def edit
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.delete
    redirect_to root_path
  end

private

  def group_params
    params.require(:group).permit(:name)
  end

end

