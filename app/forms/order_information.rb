class OrderInformation

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building_name, :phone_number

 

  with_options presence: true do
    validates :city,:phone_number,:order_id, :user_id, :item_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input half-width characters."}
  end

end