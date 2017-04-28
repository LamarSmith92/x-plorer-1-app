class CommentsController < ApplicationController
  before_action :find_satellite
  before_action :find_comment, only: [:destroy, :comment_owner]
  before_action :comment_owner, only: [:destroy]
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
  @comment.destroy
    redirect_to satellite_path(@satellite)
  end

  private
  def find_satellite
    @satellite = Satellite.find(params[:satellite_id])

  end

  def find_comment
    @comment = @satellite.comments.find(params[:id])
end

  def comment_owner
    unless current_user.id == @comment.user_id
end
end
end
