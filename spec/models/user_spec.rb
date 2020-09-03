require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能のテストコード' do
    describe 'ユーザ情報の新規登録' do

      context '新規登録がうまくいく時' do
        it 'nickname、email、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかない時' do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailがすでに登録されていると登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "emailに@が含まれていないと登録できない" do
          @user.email = "kkkgmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordは６文字以上でないと登録できない" do
          @user.password = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordは半角英数字混合でないと登録できない' do
          @user.password = 'aaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordは確認ようを含め２回入力しなければ登録できない' do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'ユーザー本名は、名字と名前が入力されてなければ登録できない' do
          @user.first_name = ''
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name は全角で入力してください。", "Last name can't be blank", "Last name は全角で入力してください。")
        end
        it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.first_name = 'abcde'
          @user.last_name = 'fghij'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name は全角で入力してください。", "Last name は全角で入力してください。")
        end
        it 'ユーザー本名のフリガナは、名字と名前を入力しなければ登録できない' do
          @user.first_name_kana = ''
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana はカタカナで入力してください。", "Last name kana can't be blank", "Last name kana はカタカナで入力してください。")
        end
        it 'ユーザー本名のフリガナは、全角（カタカナ）で入力させる' do
          @user.first_name_kana = 'あいうえお'
          @user.last_name_kana = 'かきくけこ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana はカタカナで入力してください。", "Last name kana はカタカナで入力してください。")
        end
        it '生年月日を入力していないと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end

    end
  end
end
