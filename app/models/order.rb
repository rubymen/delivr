class Order < ActiveRecord::Base
  belongs_to :type
  belongs_to :category
  belongs_to :user

  validates :type, presence: true
  validates :category, presence: true
  validates :user, presence: true

  self.per_page = 2
end
