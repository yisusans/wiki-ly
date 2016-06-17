class GroupsController < ApplicationController
include ApplicationHelper

  def index
    @groups = Group.all
    if params[:search]
      search = params[:search].downcase
      capitalize_search = search.capitalize
      @groups = Group.search(capitalize_search).order("created_at DESC")
   else
     @groups = Group.all.order('created_at DESC')
    end
  end

  def new
    redirect_to_login
    @group = Group.new
  end

  def create
    capitalize_group = params[:group][:name].downcase.capitalize
    @group = Group.new(name: capitalize_group)
    if @group.save
      @membership = Membership.create( user_id: current_user.id,
                                       role: "admin",
                                       group_id: @group.id )
      redirect_to @group
    else
      flash[:error] = @group.errors.full_messages
      redirect_to '/groups/new'
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    if @group
      @group_name = @group.name
      @users = @group.memberships
      @articles = @group.articles
      @published = @articles.where(published: true).reverse
      @unpublished = @articles.where(published: false)
      render '/groups/show'
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.delete
    redirect_to '/groups'
  end

private

  def group_params
    params.require(:group).permit(:name)
  end

end

