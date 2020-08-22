class OrderInformation

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building_name, :phone_number

 

  with_options presence: true do
    validates :city,:phone_number,:order_id, :user_id, :item_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input half-width characters."}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code, prefecture_id: prefecture_id, city: city, 
      address_line: address_line, building_name: building_name, 
      phone_number: phone_number, order_id: order.id)
  end

end