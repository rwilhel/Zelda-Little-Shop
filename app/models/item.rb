class Item < ApplicationRecord
  belongs_to :category

  has_many :orders_items
  has_many :orders, through: :orders_items

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/shield_item.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :name, use: :slugged

  def retired_item?
    self.status ? false : true
  end

  def in_stock?
    self.retired_item? ? "No" : "Yes"
  end
end
