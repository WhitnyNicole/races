class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout

  accepts_nested_attributes_for :workout 

end
