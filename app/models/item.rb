class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :title
    validates :details
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :delivery_day_id
    # validates :price
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status



   validates :category_id, :cost_id, :delivery_day_id, :prefecture_id, :status_id, numericality: { other_than: 0 } 

end




