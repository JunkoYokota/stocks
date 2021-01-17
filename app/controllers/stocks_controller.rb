class StocksController < ApplicationController
  before_action :move_to_top, except: :top
  
  def top
    @stocks = Stock.where(id: [1,2,3]).recent
  end

  def index
    @page = 10
    @stocks = Stock.where(consumed: true, user_id: current_user.id).recent.paginate(page: params[:page], per_page: @page)
  end
  
  def stocks_page
    @page = params[:per]
    @stocks = Stock.paginate(page: params[:page], per_page: @page)
    render("stock_list")
  end
  def past
    @page = 5
    @stocks = Stock.where(consumed: false, user_id: current_user.id).recent.paginate(page: params[:page], per_page: @page)
  end
  def past_page
    @page = params[:per]
    @stocks = Stock.paginate(page: params[:page], per_page: @page)
    render("past_list")
  end

  def near
    @stocks = Stock.where(consumed: true, user_id: current_user.id).stocks_near.recent.paginate(page: params[:page], per_page: 5)
  end
  def expire
    @stocks = Stock.where(consumed: true, user_id: current_user.id).stocks_expire.recent.paginate(page: params[:page], per_page: 5)
  end

  def favorites
    @stocks = Stock.where(user_id: current_user.id).stocks_favorites.recent.paginate(page: params[:page], per_page: 5)
  end
  def tags
    @stocks = Stock.where(user_id: current_user.id).stocks_tags.recent.paginate(page: params[:page], per_page: 5)
  end
  def consumed
    @stock = Stock.find(params[:id])
  end

  def consumed_update
    @stock = Stock.find(params[:id])
    @stocks.update(consumed: true)
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
    else params[:consumed]
      @stocks = Stock.where(id: params[:stocks_ids])
      @stocks.update_all(consumed: false)
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
    params.require(:stock).permit(:product_name, :expiration, :detail, :open_date, :consumed, :favorites, :tags, :content).merge(user_id: current_user.id)
  end

  def stocks_params
    params.require(:stock).permit(stocks_ids: [:product_name, :expiration, :detail, :open_date, :consumed, :favorites, :tags, :content]).merge(user_id: current_user.id)
  end
  # def tags
  #   params.require(:stock).permit(:favorites, :tags, :consumed).merge(user_id: current_user.id)
  # end

  def move_to_top
    redirect_to top_path unless user_signed_in?
  end

end

