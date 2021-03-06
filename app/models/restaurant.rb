class Restaurant < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true

  scope :by_new, ->{ order(updated_at: :desc) }
  # scope :active, ->{ where(status: :active) }

end
