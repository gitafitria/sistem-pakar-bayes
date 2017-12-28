class Trouble < ApplicationRecord
  validates :trouble_name, presence: true
  has_many :rules
end
