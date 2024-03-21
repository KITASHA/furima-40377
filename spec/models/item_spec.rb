require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品できる場合' do
      it '項目をすべて埋めると出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'item_category_idが1では出品できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_status_idが1では出品できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'fee_status_idが1では出品できない' do
        @item.fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end

      it 'pretecture_idが1では出品できない' do
        @item.pretecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Pretecture can't be blank")
      end

      it 'shipping_day_idが1では出品できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceが0~299では出品できない' do
        @item.item_price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it 'item_priceが10000000以上では出品できない' do
        @item.item_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it 'item_priceが半角数字でないと出品できない' do
        @item.item_price = '８'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '画像が空では出品できない' do
        @item.image.attach(nil)
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
