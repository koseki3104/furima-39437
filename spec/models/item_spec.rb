require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'バリデーションのテスト' do
    context '正しい条件の場合' do
      it '全ての属性が有効であること' do
        user = FactoryBot.create(:user) # ユーザーを作成
        @item = FactoryBot.build(:item, user: user) # ユーザーと価格が適切に設定されたアイテムを作成
        expect(@item).to be_valid
      end
    end

    context '不正な条件の場合' do
      it '商品名がなければ無効であること' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品名の長さが最大値を超えている場合、無効であること' do
        @item.product_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end

      it '商品説明がなければ無効であること' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it '商品説明の長さが最大値を超えている場合、無効であること' do
        @item.product_description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description is too long (maximum is 1000 characters)")
      end

      it 'カテゴリーが選択されていなければ無効であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が選択されていなければ無効であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担が選択されていなければ無効であること' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end

      it '発送元の地域が選択されていなければ無効であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が選択されていなければ無効であること' do
        @item.shipping_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration must be other than 1")
      end

      it '価格がなければ無効であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300以下の場合、無効であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が10000000以上の場合、無効であること' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が数値でない場合、無効であること' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '画像が添付されていなければ無効であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end