class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def upgrade
    @user = current_user
    if @user.role == 'standard'
      @user.role = 'premium'
    end
  end

  def downgrade
    @user = current_user
    if @user.role == 'premium'
      update_role('standard')
    end
  end

  private

  def update_role(new_role)
    @user = current_user
    @user.update_attribute(:role, new_role)
  end
end
