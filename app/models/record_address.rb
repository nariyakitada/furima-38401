class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :adress, :building_name, :phone_number,  :user_id, :product_id, :token


  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :municipalities, presence: true
  validates :adress, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/}
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :token, presence: true


  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, adress: adress, building_name: building_name, phone_number: phone_number,order_id: order.id )
  end
end
