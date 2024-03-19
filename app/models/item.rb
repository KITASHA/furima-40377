class Item < ApplicationRecord

  belongs_to :user
  #has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :pretecture
  belongs_to :shipping_day
    
  #空の投稿を保存できないようにする
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true
  validates :user, presence: true


  #ジャンルの選択が「---」の時は保存できないようにする
  validates :item_category_id, :item_status_id , :fee_status_id, :pretecture_id, :shipping_day_id,
    numericality: { other_than: 1, message: "can't be blank" } 
end
