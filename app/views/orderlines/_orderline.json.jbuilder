json.extract! orderline, :id, :order_id, :product_id, :quantity, :price, :created_at, :updated_at
json.url orderline_url(orderline, format: :json)
