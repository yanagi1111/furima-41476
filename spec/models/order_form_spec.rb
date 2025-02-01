require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'token,post_code,prefecture_id,municipality,house_number,building_name,phone_numberが存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it 'tokenが空では登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが「3桁ハイフン4桁」の半角文字列でないと登録できない' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code 半角数字とハイフンを使用してください')
      end
      it 'prefecture_idが未選択では登録できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では登録できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number 10桁もしくは11桁の半角数字のみを使用してください')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number 10桁もしくは11桁の半角数字のみを使用してください')
      end
      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number 10桁もしくは11桁の半角数字のみを使用してください')
      end
      it 'user_idが紐づいていないと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
