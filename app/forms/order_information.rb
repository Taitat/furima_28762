class OrderInformation

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building_name, :phone_number,:order_id,:token

 

  with_options presence: true do
    validates :city, :user_id, :item_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number,format:{with: /\A\d{1,11}\z/,messages: "is invalid. Input correct number."}
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, messages: "is invalid. Input half-width characters."}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code, prefecture_id: prefecture_id, city: city, 
      address_line: address_line, building_name: building_name, 
      phone_number: phone_number, order_id: order.id)
  end

end