class User < ActiveRecord::Base
  has_many :invoices, dependent: :destroy
  has_many :banks,    dependent: :destroy
  has_many :senders,  dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
