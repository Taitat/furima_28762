class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling_time
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  validate :image_presence

  validates :user, :name, :description, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :handling_time_id,
            :postage_payer_id, :prefecture_id, presence: true, numericality: { other_than: 1 }

  def image_presence
    unless self.images.attached?
      errors.add(:image, "can't be blank")
    end
  end
end
