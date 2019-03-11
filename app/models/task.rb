class Task < ApplicationRecord
  validates :title ,presence:true, uniqueness:true
  validates :memo ,presence:true,length:{maximum:30, minimum:10}
end
