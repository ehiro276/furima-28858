require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能のテストコード' do
    describe '商品の購入' do
      context '購入がうまくいく時' do
        it 'postcode,prefecture_id,city,number,building,telephone_number,user_id,item_id,card_tokenが存在すれば購入できる' do
          expect(@user_order).to be_valid
        end
      end
    end
  end


end
