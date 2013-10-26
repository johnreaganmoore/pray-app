class Slot < ActiveRecord::Base
  belongs_to :church
  belongs_to :user
end
