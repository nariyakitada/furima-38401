class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :area
  belongs_to :shipment
  has_one :order

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :situation_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :delivery_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :area_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :shipment_id, numericality: { other_than: 1 , message: "を入力してください"} 
  validates :price, presence: true, inclusion: { in: 300..9999999 }
end
