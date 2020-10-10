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

  def confirm
    Stock.where(id：params [：stocks_ids]).destroy_all
    @stock = stock.find(params[:ids])
    if @stock.invalid?
      render :edit
    end
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

  def destroy_all
    checked_data = params[:deletes].keys
    if Stocks.destroy(checked_data)
      redirect_to stocks_path
    else
      render action: 'index'
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date)
  end

end
