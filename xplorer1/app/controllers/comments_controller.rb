class CommentsController < ApplicationController
  before_action :find_satellite
  before_action :find_comment, only: [:destroy]
  def create
    @satellite = Satellite.find(params[:satellite_id])
    @comment = @satellite.comments.create(params[:comment].permit(:title, :content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save

    redirect_to satellite_path(@satellite)
  else
    render 'new'
  end
  end

  def destroy
  if  @comment.destroy

    redirect_to satellite_path(@satellite)
  end

  private
  def find_satellite
    @satellite = Satellite.find(params[:satellite_id])

  end

  def find_comment
    @comment = @satellite.comments.find(params[:id])
  end

end
