class Indication < ApplicationRecord
  has_many :rules
  
  default_scope { where(is_active: true) }
end
