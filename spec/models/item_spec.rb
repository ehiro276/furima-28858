require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能のテストコード' do
    describe '出品商品の登録' do
      context '出品がうまくいく時' do
        it 'image,name,info,category_id,condition_id,cost_id,area_id,sendout_id,priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかない時' do
        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空では登録できない' do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end
        it '商品のカテゴリー が空では登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品のカテゴリーが[---]では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態が空では登録できない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it '商品の状態が[---]では登録できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
        it '商品の配送料負者が空では登録できない' do
          @item.cost_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost can't be blank")
        end
        it '商品の配送料負担者が[---]では登録できない' do
          @item.cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Cost must be other than 1')
        end
        it '商品の地域が空では登録できない' do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it '商品の地域が[---]では登録できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it '商品の発送日が空では登録できない' do
          @item.sendout_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Sendout can't be blank")
        end
        it '商品の発送日が[---]では登録できない' do
          @item.sendout_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Sendout must be other than 1')
        end
        it '商品の値段が空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number', "Price can't be blank", 'Price is invalid')
        end
        it '商品の値段が300円以上でなければ登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 300')
        end
        it '商品の値段が9999999円以下でなければ登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than 9999999')
        end
      end
    end
  end
end
