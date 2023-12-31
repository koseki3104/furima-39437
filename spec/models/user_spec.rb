require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'バリデーションのテスト' do
    context '正しい条件の場合' do
      it 'ニックネーム、メールアドレス、パスワード、パスワード確認、姓、名、姓（カナ）、名（カナ）、生年月日があれば有効であること' do
        expect(@user).to be_valid
      end
    end

    context '不正な条件の場合' do
      it 'ニックネームがなければ無効であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'ニックネームの長さが最大値を超えている場合、無効であること' do
        @user.nickname = 'a' * 41
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end

      it 'メールアドレスがなければ無効であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスの場合、無効であること' do

        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスの形式が正しくない場合、無効であること' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードがなければ無効であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードの長さが最小値未満の場合、無効であること' do
        @user.password = 'pass'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが英字のみの場合、無効であること' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードが数字のみの場合、無効であること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードに全角文字が含まれている場合、無効であること' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
        
          it '姓がなければ無効であること' do
            @user.last_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
          end

          it '姓に半角文字が含まれていると登録できない' do
            @user.last_name = 'Yamada'
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name is invalid")
          end
    
          it '名がなければ無効であること' do
            @user.first_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank")
          end

          it '姓に半角文字が含まれていると登録できない' do
            @user.first_name = 'Taro'
            @user.valid?
            expect(@user.errors.full_messages).to include("First name is invalid")
          end
    
          it '姓（カナ）がなければ無効であること' do
            @user.last_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end

          it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
            invalid_last_name_kana = '山だ123!' 
            @user.last_name_kana = invalid_last_name_kana
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is invalid")
          end
    
          it '名（カナ）がなければ無効であること' do
            @user.first_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end

          it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
            invalid_first_name_kana = 'た郎123!' 
            @user.first_name_kana = invalid_first_name_kana
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")
          end
    
          it '生年月日がなければ無効であること' do
              @user.birth_date = nil
              @user.valid?
              expect(@user.errors.full_messages).to include("Birth date can't be blank")
            end
          end
        end
      end