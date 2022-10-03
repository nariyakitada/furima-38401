require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, product_id: product.id)
  end

  describe '購入記録の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
      
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が必須であること' do
        @record_address.area_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が必須であること' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須であること' do
        @record_address.adress = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が必須であること' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @record_address.phone_number = '11111'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end