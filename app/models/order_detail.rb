class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { no_running: 0, wating: 1, running: 2, complete: 3 }
end
