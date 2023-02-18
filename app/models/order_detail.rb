class OrderDetail < ApplicationRecord
  enum :making_status, { no_running: 0, wating: 1, running: 2, complete: 3 }
end
