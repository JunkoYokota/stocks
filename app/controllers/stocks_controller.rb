class StocksController < ApplicationController
  # before_action :authenticate_user!, only: [:index]

  def top
    # if user_signed_in?
    #   render :index
    # end
  end

  def index
    @stocks = Stock.recent
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
    redirect_to stocks_path
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    # redirect_to stock_path
  end

  def confirm
    if params[:edit_all]
      redirect_to test_path(stocks_ids: params[:stocks_ids])
    elsif params[:delete_all]
      @stocks = Stock.where(id: params[:stocks_ids])
        @stocks.each do |stock|
          stock.destroy
        end
      redirect_to stocks_path
    end
  end
  
  def test
    @stocks = Stock.where(id: params[:stocks_ids])
  end

  def update_all
    stocks = params.permit!.to_h[:stocks]
    stocks.each do |stock|
      stock_db = Stock.find(stock[0])
      stock_db.update!(stock[1])
    end
    redirect_to stocks_path
  end

  private
  def stock_params
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date)
  end

  def stocks_params
    params.permit(stocks_ids: [:product_name, :expiration, :detail, :open_date])
  end

end

