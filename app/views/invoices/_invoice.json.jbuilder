json.extract! invoice, :id, :serial_number, :recipient, :title, :total_amount, :billing_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
