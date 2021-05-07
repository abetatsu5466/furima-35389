require 'rails_helper'

RSpec.describe User, type: :model do
   before do
     @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    it 'nicknameが必須であること' do
      user = User.new(nickname: ''）
      user.valid?
      expect(user.errors.full_messages).to include("Nickname con't be blank")
    end
    it 'emailが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Ninkname can't be blank")
      
    end
    it 'emailが一意性であること' do
      @email.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email ='test@example'
      expect(@user).to be_valid
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password con't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 6 characters")
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '00000a'
      @user.password_confirmation = '00000a'
      expect(@user).to be_valid
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '00000a'
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match password")
    end
  end
end
