require 'active_record/associations'

class Guest
  delegate :invoices, :banks, :senders, to: :guest_user

  def name
    "ゲスト"
  end

  def guest_user
    User.find_by(email: 'foo@example.com')
  end
end