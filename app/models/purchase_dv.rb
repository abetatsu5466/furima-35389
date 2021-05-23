class PurchaseDv
  

  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture_id, :address, :house_number, :building_name, :phone_number, :item_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address
    validates :house_number
    validates :building_name           
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # donation_idには、変数donationのidと指定する
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, address: address, house_number: house_number,building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end
