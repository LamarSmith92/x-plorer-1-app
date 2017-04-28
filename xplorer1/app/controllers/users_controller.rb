class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_comments = @user.comments
  end
  def update
    @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to root_path, :notice => 'no problems'
      else
        redirect_to root_path, :alert => 'something went wrong'
      end
    end
    def about
      @user = User.find(params[:id])
    end
    private
    def secure_params
      params.require(:user).permit(:first_name, :last_name, :image, :about, :birthday, :city, :state)
    end
    end
