class Trouble < ApplicationRecord
  validates :trouble_name, presence: true
  has_many :rules

  default_scope { where(is_active: true) }
end
