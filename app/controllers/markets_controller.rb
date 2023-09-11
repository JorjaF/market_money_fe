class MarketsController < ApplicationController
  def index
    @markets = MarketApiHelper.fetch_markets
  end

  def show
    @market = MarketApiHelper.fetch_market(params[:id])
    @vendors = MarketApiHelper.fetch_vendors(params[:id])
  end
end
