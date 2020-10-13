class StocksController < ApplicationController
  def index
    @stocks = Stock.order(:expiration)
  end

  def new
    @stock = Stock.new
  end

  def back
    @stock = Stock.find(params[:ids])
    render :edit
  end

  def create
    @stock = Stock.new(stock_params).save
    redirect_to stocks_path
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    Stock.find(params[:id]).update(stock_params)
    redirect_to stock_path
  end

  def destroy
    Stock.find(params[:id]).destroy
    redirect_to stocks_path
  end

  def confirm
    if params[:edit_all]
      @stocks = Stock.where(id: params[:stocks_ids])
    elsif params[:delete_all]
      @stocks = Stock.where(id: params[:stocks_ids])
      @stocks.each do |stock|
        stock.destroy
      end
      redirect_to stocks_path
    end
  end
  
  def update_all
    @stocks = Stock.where(params[:ids])
    @stocks.each do |stock|
      stock.update(stocks_params)
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date)
  end

  def stocks_params
    params.permit(ids: [:product_name, :expiration, :detail, :open_date])
  end

end
