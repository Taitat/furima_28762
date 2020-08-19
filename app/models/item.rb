class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling_time
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  validates :user, :name, :description, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :categories_id, :conditions_id, :handling_times_id,
            :postage_payers_id, :prefecture_id, presence: true, numericality: { other_than: 1 }
end
