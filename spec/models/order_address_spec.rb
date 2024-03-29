require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    user = FactoryBot.create(:user)  
    item = FactoryBot.create(:item)  
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では出品できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephone_numが空だと保存できないこと' do
        @order_address.telephone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone num can't be blank")
      end

      it 'telephone_numは9桁以下だと保存できないこと' do
        @order_address.telephone_num = '66666'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone num should be a half-width numeric value with 10 to 11 digits")
      end
      it 'telephone_numは12桁以上だと保存できないこと' do
        @order_address.telephone_num = '12345678912345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone num should be a half-width numeric value with 10 to 11 digits")
      end
      it 'telephone_numが半角数字でないと保存できないこと' do
        @order_address.telephone_num = '７７７７７７７７７７７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone num should be a half-width numeric value with 10 to 11 digits")
      end

      it 'userが紐付いていなければ投稿できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")

      end

      it 'itemが紐付いていなければ投稿できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
