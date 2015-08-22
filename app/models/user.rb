class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buckets
  has_many :expenses
  has_many :incomes
  has_many :bucket_orders

  def total
    buckets.sum(:amount)
  end
end
