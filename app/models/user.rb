class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :admin, :premium]

  after_initialize :init

  def init
    self.role ||= 0
  end

  def upgrade
    if self.role == 'standard'
      update_role('premium')
    end
  end

  def downgrade
    if self.role == 'premium'
      update_role('standard')
    end
  end

  private

  def update_role(new_role)
    self.update_attribute(:role, new_role)
  end
end
