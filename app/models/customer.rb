class Customer < ApplicationRecord
  scope :not_banned, -> { where('customer.banned = false')}
end
