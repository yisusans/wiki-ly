class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      @tag = Tag.create( user_id: current_user.id,
                                       role: "admin",
                                       group_id: @group.id )
    else

    end

  end


private
  def tag_params
    params.require(:tag).permit(:label)
  end

end
