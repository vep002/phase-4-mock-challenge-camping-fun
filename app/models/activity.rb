class Activity < ApplicationRecord
  has_many :signups, dependent: :destroy # cascading delete (old grumpy sql devs say this)
  has_many :campers, through: :signups

end
