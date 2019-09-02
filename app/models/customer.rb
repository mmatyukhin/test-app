class Customer < ApplicationRecord
  scope :not_banned, -> { Customer.where(banned: false) }
  scope :got_ban, -> { Customer.where(banned: true) }

  def ban_it
    self.banned = true
    self.save
  end

  def unban_it
    self.banned = false
    self.save
  end

  def self.search_by_phone(phone)
    result = all

    result = result.where(phone: phone)

    result
  end
end
