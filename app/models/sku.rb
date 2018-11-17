class Sku < ApplicationRecord
  belongs_to :supplier, primary_key: 'code', foreign_key:'supplier_code'

  validates :sku, :supplier_code, :name, :price, presence: true
end
