class Image < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :upload
end
