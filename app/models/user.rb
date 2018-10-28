class User < ActiveRecord::Base
  has_many :invoices
  has_many :banks
  has_many :senders

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
