require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @user.password = 'sss111'
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirm,
          first_name,family_name,first_name_kana,family_name_kana,date_select が存在すれば登録できる" do
        @user = User.new(nickname: '12', email: 'email@email.co.jp', password: 'sss111',
                         password_confirm: 'sss111', first_name: '山田', family_name: '花子', first_name_kana: 'ヤマダ',
                         family_name_kana: 'ハナコ', date_select: '1940-01-01')
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password
        expect(@user).to be_valid
      end
      it 'passwordに半角英数字混合で含まれていれば登録できる' do
        @user.password
        expect(@user).to be_valid
      end
      it 'passwordが確認用を含めて2回入力していれば登録できる' do
        @user.password
        @user.password_confirm = 'sss111'
        expect(@user).to be_valid
      end
      it 'emailに@を含む記述であれば登録できる' do
        @user.email = "{/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }"
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@がなければ登録できない' do
        @user.email = "samplegmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスに「@」を挿入してください。「」内に「@」がありません。")
      end
      it 'passwordは英数字が含まれたものでなければ登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'sss11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmが空では登録できない' do
        @user.password_confirm = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'date_selectが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date select can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.password = 'firstname'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'family_nameが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'familyname'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end
      it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width characters')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width characters')
      end
    end
  end
end
