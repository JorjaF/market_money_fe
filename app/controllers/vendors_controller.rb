class VendorsController < ApplicationController
  def show
    @vendor = VendorApiHelper.fetch_vendor(params[:id])
  end
end
