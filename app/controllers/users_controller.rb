class UsersController < ApplicationController

  def index
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      format.html { redirect_to root_path, notice: 'Indication was successfully created.' }
    end
  end

  private
    def user_params
      params.require(:user).permit(:password, :password)
    end

end
