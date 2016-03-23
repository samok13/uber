class UsersController < ApplicationController

def index
  redirect_to new_user_path
end

  def new
    @user = User.new
  end

  # TODO: welcome email
  def create
    @user = User.new( user_params )
    if @user.save
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Oops... please correct errors and try again: " +
        @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  private

  def user_params
    #put params
    # TODO: update necessary params based on backend
    params.require(:user).permit(:email)
  end

end
