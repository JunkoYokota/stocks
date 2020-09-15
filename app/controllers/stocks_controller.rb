class StocksController < ApplicationController
  def index
    @stocks = Stock.order(:expiration)
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params).save
    redirect_to stocks_path
    # インスタンスの保存に成功した場合の処理
    #if @stock.save
    #  redirect_to @stock

    # インスタンスの保存に失敗した場合の処理
    #else
    #  render :new
    #end
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

  private
  def stock_params
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date)
  end

end
