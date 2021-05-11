require 'rails_helper'

RSpec.describe User, type: :model do
   before do
     @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    context "正しく保存できるとき" do
     it"nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる"do
       expect(@user).to be_valid
      end
    end
  end
  context "保存できないとき" do
    it 'nicknameが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email ='testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '666666'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '00000a'
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること1' do
     @user.first_name_kana = 'aaaa'
     @user.valid?
     expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること2' do
      @user.last_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力して下さい")
     end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること1' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること2' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力して下さい")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Last name kana 全角カタカナで入力して下さい")
    end

    it '生年月日が必須であること' do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
