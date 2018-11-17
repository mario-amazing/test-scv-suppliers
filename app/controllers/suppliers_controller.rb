class SuppliersController < ApplicationController
  def index
    # Add paginatio when will be requirements
    @suppliers = Supplier.all
  end
end
