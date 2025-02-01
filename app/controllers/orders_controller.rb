class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name,
                                       :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if (@item.order.present? && (current_user != @item.user)) || (current_user == @item.user)
  end
end
