class Vote < ApplicationRecord
  # validates :title, presence:true
  validates :count, presence:true
end
