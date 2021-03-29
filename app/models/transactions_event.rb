class TransactionsEvent < ApplicationRecord
  belongs_to :trans, class_name: 'Transaction'
  belongs_to :event
end
