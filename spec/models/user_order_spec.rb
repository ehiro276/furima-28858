require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
    sleep(0.2)
  end

  describe '商品購入機能のテストコード' do
    describe '商品の購入' do
      context '購入がうまくいく時' do
        it 'postcode,prefecture_id,city,number,building,telephone_number,user_id,item_id,card_tokenが存在すれば購入できる' do
          expect(@user_order).to be_valid
        end
      end

      context '出品がうまくいかない時' do
        it 'card_tokenがなければ登録できない' do
          @user_order.card_token = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Card token can't be blank")
        end
        it 'postcodeがなければ登録できない' do
          @user_order.postcode = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid")
        end
        it 'postcodeが数字７文字でなければ登録できない' do
          @user_order.postcode = '123-456'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Postcode is invalid")
        end
        it 'postcodeがハイフンがなければ登録できない' do
          @user_order.postcode = '1234567'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Postcode is invalid")
        end
        it 'prefecture_idが[---]では登録できない' do
          @user_order.prefecture_id = 1
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'cityが空では登録できない' do
          @user_order.city = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("City can't be blank")
        end
        it 'numberが空では登録できない' do
          @user_order.number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Number can't be blank")
        end
        it 'numberが空では登録できない' do
          @user_order.number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Number can't be blank")
        end
        it 'telephone_numberが空では登録できない' do
          @user_order.telephone_number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
        end
        it 'telephone_numberが11桁以内の数字でなければ登録できない' do
          @user_order.telephone_number = '080123456789'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Telephone number is invalid")
        end
      end

    end
  end

end
