class Item < ApplicationRecord

    belongs_to :user
    has_many :images
    has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :handling_time
    belongs_to_active_hash :postage_payer
    belongs_to_active_hash :prefecture
  
validates :images, presence: true
validates :user, presence: true

validates :categories,:conditions,:handling_times,
          :postage_payers,:prefecture, presence: true,numericality: { other_than: 1}



end
