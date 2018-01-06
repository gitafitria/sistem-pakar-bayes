class Rule < ApplicationRecord
  belongs_to :trouble
  belongs_to :indication

  default_scope { where(is_active: true) }

end
