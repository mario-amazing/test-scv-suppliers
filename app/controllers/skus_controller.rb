class SkusController < ApplicationController
  def index
    # Add paginatio when will be requirements
    @skus = Sku.includes(:supplier).limit(100)
  end
end
