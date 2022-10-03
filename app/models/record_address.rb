class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :adress, :building_name, :phone_number,  :user_id, :product_id, :token

  with_options presence: true do
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :area_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :municipalities
  validates :adress
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :user_id
  validates :product_id
  validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, adress: adress, building_name: building_name, phone_number: phone_number,order_id: order.id )
  end
end
