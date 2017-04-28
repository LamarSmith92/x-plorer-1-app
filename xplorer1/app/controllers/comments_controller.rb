class CommentsController < ApplicationController
  def create
    @satellite = Satellite.find(params[:id])
    @comment = @satellite.comments.create(params[:comment].permit(:title, :content))

    redirect_to satellite_path(@satellite)
  end

  def destroy
    @satellite = Satellite.find(params[:id])
    @comment = @satellite.comments.find(params[:id])
    @comment.destroy

    redirect_to satellite_path(@satellite)
  end
end
