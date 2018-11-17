class Supplier < ApplicationRecord
  has_many :skus, primary_key: 'code', foreign_key:'supplier_code'

  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
