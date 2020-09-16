require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    
    @user_order = FactoryBot.build(:user_order)
    @item.image = fixture_file_upload('public/images/test_image.png')
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
