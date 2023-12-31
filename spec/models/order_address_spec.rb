require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  
  describe 'バリデーションのテスト' do
    context '正しい条件の場合' do
      it '全ての属性が有効であること' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_address.address_line2 = nil
        expect(@order_address).to be_valid
      end
    end

    context '不正な条件の場合' do
      it 'user_idがなければ無効であること' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがなければ無効であること' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号がなければ無効であること' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号のフォーマットが正しくない場合、無効であること' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Should be in the format XXX-XXXX")
      end

      it '都道府県がなければ無効であること' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村がなければ無効であること' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '住所がなければ無効であること' do
        @order_address.address_line1 = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it '電話番号がなければ無効であること' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満の場合、無効であること' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only allows 10 to 11 digits.")
      end

      it '電話番号が11桁を超える場合、無効であること' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only allows 10 to 11 digits.")
      end

      it '電話番号に半角数字以外の文字が含まれていると無効であること' do
        @order_address.phone_number = '123-456-7890' 
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("is invalid. Only allows 10 to 11 digits.")
      end

      it 'トークンがなければ無効であること' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end