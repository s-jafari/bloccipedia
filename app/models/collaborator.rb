class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user

  validates :user_id, uniqueness: true
end
