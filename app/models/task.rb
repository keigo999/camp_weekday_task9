class Task < ApplicationRecord
  validates :title ,presence:true, uniqueness:true
  validates :memo ,presence:true,length:{maximum:30, minimum:10}

  enum status: {draft: 0, published: 1, archieved: 2}
end
