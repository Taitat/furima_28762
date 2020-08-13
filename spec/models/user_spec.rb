require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "パスワードが6文字以上かつ英数混合なら登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end

      it "メールアドレスに@が含まれていれば登録できる" do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end

      it "苗字と名前が漢字・平仮名・カタカナなら登録できる" do
        @user.last_name = "山田"
        @user.first_name = "太朗"
        expect(@user).to be_valid
      end

      it "読み仮名がカタカナなら登録できる" do
        @user.last_name_kana = "ヤマダ"
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空の時は登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "passwordが空の時は登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "password_confirmationが空の時は登録できない" do        
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "passwordが5文字以下の時は登録できない" do
        @user.password = "aaa55"
        @user.password_confirmation = "aaa55"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英数混合でない場合は登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end


      it "emailが空の時は登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が含まれない場合は登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailがすでに存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "last_nameが空の時は登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空の時は登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空の時は登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空の時は登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dateが空の時は登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "last_nameが漢字・ひらがな・カタカナ以外の場合は登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが漢字・ひらがな・カタカナ以外の場合は登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_name_kanaがカタカナ以外の場合は登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "first_name_kanaがカタカナ以外の場合は登録できない" do
        @user.first_name_kana = "太朗"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      

    
    end
  end
end
