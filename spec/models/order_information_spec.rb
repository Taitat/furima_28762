require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order = FactoryBot.build(:order_information)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば商品を購入できる' do
        expect(@order).to be_valid
      end

      it 'building_nameがなくても登録できる' do
        @order.building_name = ""  
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_codeがないと購入できない' do
        @order.post_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeがの3桁の数字と4桁の数字をハイフンで繋いだフォーマットじゃないと購入できない' do
        @order.post_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idがないと購入できない' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityがないと購入できない' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineがないと購入できない' do
        @order.address_line = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phone_numberがないと購入できない' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと購入できない' do
        @order.phone_number = "080123456780"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'カード情報が正しく入力され、トークンが生成できてないと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end

end
