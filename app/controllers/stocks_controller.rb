class StocksController < ApplicationController
  def index
    @stocks = Stock.order(:expiration)
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

end
