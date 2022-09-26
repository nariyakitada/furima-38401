class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :area
  belongs_to :shipment

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, inclusion: { in: 300..9999999 }
end
