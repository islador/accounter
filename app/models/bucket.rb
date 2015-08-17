class Bucket < ActiveRecord::Base
  belongs_to :user
  belongs_to :bucket_order

  has_many :transactions
end
