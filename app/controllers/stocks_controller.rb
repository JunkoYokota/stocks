class StocksController < ApplicationController
  # before_action :authenticate_user!, only: [:index]
  before_action :move_to_top, except: :top
  

  def top
    @stocks = Stock.find(2,3,12)
    # if user_signed_in?
    #   render :index
    # end
  end

  def index
    @stocks = Stock.all.includes(:user).where(user_id: current_user.id).recent.page(params[:page]).per(5)

    # @stocks = Stock.all.includes(:user).where(user_id: current_user.id).recent.page(params[:page]).per(params[:display_number])
  end

# 検索用
# def index
#   @q = Stocks.ransack(params[:q])
#   @stocks = @q.result.page(params[:page]).per(params[:display_number])
# end

  def near
    @stocks = Stock.where(user_id: current_user.id).stocks_near.recent.page(params[:page]).per(5)
  end

  def expire
    @stocks = Stock.where(user_id: current_user.id).stocks_expire.recent.page(params[:page]).per(5)
  end

  def new
    @stock = Stock.new
    @user = current_user
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.user_id = current_user.id
    if
      @stock.save
      redirect_to stocks_path
    else
      render "new"
    end
  end

  # def back
  #   @stock = Stock.find(params[:ids])
  #   render :edit
  # end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if
      @stock.update(stock_params)
      redirect_to stocks_path
    else
      render "edit"
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    # redirect_to stock_path
  end

  def confirm
    if params[:edit_all]
      redirect_to confirm_update_path(stocks_ids: params[:stocks_ids])
    elsif params[:delete_all]
      @stocks = Stock.where(id: params[:stocks_ids])
        @stocks.each do |stock|
          stock.destroy
        end
      redirect_to stocks_path
    end
  end

  def confirm_update
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
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date, :content).merge(user_id: current_user.id)
  end

  def stocks_params
    params.permit(stocks_ids: [:product_name, :expiration, :detail, :open_date, :content])
  end

  def move_to_top
    redirect_to top_path unless user_signed_in?
  end

  def content

  end



end

