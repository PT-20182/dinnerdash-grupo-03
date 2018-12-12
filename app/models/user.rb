class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :name , presence: true
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_destroy :delete_orders
  
  def delete_orders
    self.orders.each do |item|
      item.destroy
    end
  end
end
