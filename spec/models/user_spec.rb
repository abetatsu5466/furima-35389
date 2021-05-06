require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが必須であること' do
      user = User.new(nickname: ''）
      user.valid?
      expect(user.errors.full_messages).to include("Nickname con't be blank")
    end
    it 'emailが必須であること' do
      
    end
    it 'emailが一意性であること' do
      
    end
    it 'メールアドレスは、@を含む必要があること' do
      
    end
    it 'パスワードが必須であること' do
      
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      
    end
  end
end
