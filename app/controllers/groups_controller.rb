class GroupsController < ApplicationController

  def index
    @groups = Group.all
    render 'index'
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end


end
