require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end


  describe 'ユーザー新規登録' do
    it "商品画像を1枚つけることが必須であること" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Image can't be blank"
    end

    it "商品名が必須であること" do
      @product.item_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Item name can't be blank"
    end

    it "商品の説明が必須であること" do
      @product.explanation = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Explanation can't be blank"
    end

    it "カテゴリーの情報が必須であること" do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

    it "商品の状態の情報が必須であること" do
      @product.situation_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include "Situation can't be blank"
    end

    it "配送料の負担の情報が必須であること" do
      @product.delivery_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include "Delivery can't be blank"
    end

    it "発送元の地域の情報が必須であること" do
      @product.area_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include "Area can't be blank"
    end

    it "発送までの日数の情報が必須であること" do
      @product.shipment_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include "Shipment can't be blank"
    end

    it "価格の情報が必須であること" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "価格が￥300以下だと保存できないこと" do
      @product.price = '299'
      @product.valid?
      expect(@product.errors.full_messages).to include "Price is not included in the list"
    end

    it "価格が￥9,999,999以上だと保存できないこと" do
      @product.price = '10000000'
      @product.valid?
      expect(@product.errors.full_messages).to include "Price is not included in the list"
    end

    it "価格は半角数値のみ保存可能であること" do
      @product.price = 'あ'
      @product.valid?
      expect(@product.errors.full_messages).to include "Price is not included in the list"
    end
  end

end
