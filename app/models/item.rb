class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :pretecture
  belongs_to :shipping_day

  # 空の投稿を保存できないようにする
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :item_category_id, :item_status_id, :fee_status_id, :pretecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
