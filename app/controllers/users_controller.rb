class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def downgrade
    @user = current_user
    @user.downgrade
    if @user.save
      flash[:notice] = "Your account was downgraded successfully."
      redirect_to edit_user_registration_path
    else
      flash.now[:alert] = "There was an error downgrading your account. Please try again."
      redirect_to edit_user_registration_path
    end
  end

end
