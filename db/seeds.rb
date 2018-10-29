User.where(email: 'foo@example.com').destroy_all
user_params = Monban.config.sign_up_service.new(email: "foo@example.com", password: "password").send(:user_params)
user = User.create(user_params)
tax = Tax.find_or_create_by(rate: 8.0)
sender = Sender.find_or_initialize_by(name: 'オフィス　エービーシー')
sender.assign_attributes({
  email: "info@officeABC.com",
  telephone: "03-3333-3333",
  postal_code: "111-2222",
  address1: "東京都",
  address2: "渋谷区 1-2-3",
  address3: "ABCビル",
})
sender.user = user
sender.save
bank = Bank.find_or_initialize_by(bank_name: '東京ZZZ銀行')
bank.assign_attributes({
  branch_name: "東京支店",
  account_type: "（普）",
  account_number: "7777777",
  account_holder: "オフィス　エービーシー",
})
bank.user = user
bank.save
invoice = Invoice.find_or_initialize_by(serial_number: '20181101_001')
invoice.assign_attributes({
  recipient: 'サンプル株式会社',
  title: 'アプリケーション開発',
  total_amount: 583_200,
  billing_date: Date.new(2018, 11, 1)
})
invoice.user = user
invoice.bank = bank
invoice.sender = sender
invoice.tax = tax
invoice.save
product = Product.new({
  name: 'プログラム一式',
  number: 1,
  unit: '個',
  unit_price: 500_000,
  amount: 500_000,
})
product.invoice = invoice
product.save
product = Product.new({
  name: 'マニュアル作成',
  number: 2,
  unit: '個',
  unit_price: 20_000,
  amount: 40_000,
})
product.invoice = invoice
product.save
