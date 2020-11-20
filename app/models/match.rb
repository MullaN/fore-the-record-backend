class Match < ApplicationRecord
  belongs_to :course
  has_many :rounds
  has_many :users, through: :rounds

end
