require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it "nicknameがない場合は登録できないこと" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it "passwordがない場合は登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password"
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角英数字混合でないと登録できないこと'do
      @user.password = '123456'
      @user.password_confirmation = '12346'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is invalid"
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
    end

    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須なこと" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it "last_nameは全角（漢字・ひらがな・カタカナ）での入力が必須なこと" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end


    it "first_name2がない場合は登録できないこと" do
      @user.first_name2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name2 can't be blank", "First name2 is invalid"
    end

    it "last_name2がない場合は登録できないこと" do
      @user.last_name2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name2 can't be blank", "Last name2 is invalid"
    end

    it "first_name2は、全角（カタカナ）での入力が必須であること" do
      @user.first_name2 = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name2 is invalid"
    end

    it "last_name2がない場合は登録できないこと" do
      @user.last_name2 = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name2 is invalid"
    end

    it "birthdayがない場合は登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end


  end
end
