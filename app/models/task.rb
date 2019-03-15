class Task < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :memo, presence: true, length: { maximum:30, minimum:10 }

  #enumを使いDBには整数を保存して、表示するときには文字列にする
  enum status: { draft: 0, published: 1, archieved: 2 }
end
