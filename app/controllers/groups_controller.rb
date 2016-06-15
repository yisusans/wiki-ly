class GroupsController < ApplicationController

  def index
    @groups = Group.all
    render 'index'
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      @errors = @group.errors.full_messages

  end

  def show
  end

  def edit
  end

private

  def group_params
    params.require(:group).permit(:name)
  end

end

