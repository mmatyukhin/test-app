class Customer < ApplicationRecord
  scope :not_banned, -> { Customer.where(banned: false) }
  scope :got_ban, -> { Customer.where(banned: true) }

  def ban
    self.banned = true
    self.save
  end
end
