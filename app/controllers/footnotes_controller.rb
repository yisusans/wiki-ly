class FootnotesController < ApplicationController

  def new
    @footnote = Footnote.new
  end

  def create
    @footnote = Footnote.new(footnote_params)

    if @footnote.save
      redirect_to @footnote
    else
      @errors = @footnote.errors.full_messages
      render '/footnote/new'
    end
  end

  def edit
    @footnote = Footnote.find_by(id: params[:id])
  end

  def destroy
    @footnote = Footnote.find_by(id: params[:id])
    @footnote.delete
    redirect_to root_path
  end

private
  def footnote_params
    params.require(:footnote).permit(:body, :section)
  end

end
