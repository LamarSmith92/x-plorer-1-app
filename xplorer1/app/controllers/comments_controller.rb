class CommentsController < ApplicationController

  before_action :find_satellite
  before_action :find_comment, only: [:destroy, :comment_owner]
  before_action :comment_owner, only: [:destroy, :first_name]

  def index
    @comments = Comment.all.order('created_at DESC')
  end
  def create
      @satellite = Satellite.find(params[:satellite_id])
      @comment = @satellite.comments.create(params[:comment].permit(:title, :content))
      if current_user == nil
        flash[:error] = "You must be signed in"
        redirect_to new_user_session_path
        return
    else @comment.user_id = current_user.id
    end
      if @comment.save
        flash[:notice] = "Successfully created a comment"
      redirect_to satellite_path(@satellite)
    else
      flash[:error] = "Something went wrong"
      redirect_to satellite_path(@satellite.id)
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
