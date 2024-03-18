require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it 'nickname、email、password、password_confirmation、last_name、first_nam、last_name_kana 、first_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      expect(@user).to_not be_valid
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      expect(@user).to_not be_valid
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      expect(@user).to_not be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'PASSWORD'
      @user.password_confirmation = 'PASSWORD2'
      expect(@user).to_not be_valid
    end
    it '重複したemailが存在する場合は登録できない' do
      FactoryBot.create(:user, email: @user.email)
      expect(@user).to_not be_valid
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'EMAIL'
      expect(@user).to_not be_valid
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'fvju'
      expect(@user).to_not be_valid
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = 'a' * 129
      @user.password_confirmation = @user.password
      expect(@user).to_not be_valid
    end
    it'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'password' # パスワードが半角英字のみの場合
      expect(@user).to_not be_valid

      @user.password = '12345678' # パスワードが半角数字のみの場合
      expect(@user).to_not be_valid

      @user.password = 'パスワード' # パスワードが全角文字の場合
      expect(@user).to_not be_valid
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      expect(@user).to_not be_valid
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      expect(@user).to_not be_valid
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      expect(@user).to_not be_valid
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      expect(@user).to_not be_valid
    end

    it 'last_name_kanaが全角カナでないと登録できない' do
      @user.last_name_kana = 'あいうえお'
      expect(@user).to_not be_valid

      @user.last_name_kana = 'yamada'
      expect(@user).to_not be_valid
    end

    it 'first_name_kanaが全角カナでないと登録できない' do
      @user.first_name_kana = 'あいうえお'
      expect(@user).to_not be_valid

      @user.first_name_kana = 'yamada'
      expect(@user).to_not be_valid
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      expect(@user).to_not be_valid
    end
  end
end