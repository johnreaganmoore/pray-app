class Church < ActiveRecord::Base
  has_many :slots
  has_many :users, through: :slots
end
