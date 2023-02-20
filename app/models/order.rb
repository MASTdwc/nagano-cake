class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { waiting: 0, payment_confirmation: 1, making: 2, preparation: 3, sent: 4}
end