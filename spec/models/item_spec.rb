require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規投稿商品' do
    context '新規投稿がうまくいくとき' do
      it "画像、商品名、商品の説明、カテゴリー、配送料、発送元、発送までの日数、価格が存在すれば投稿できる" do
        @item =Items.new(image: 'url', title: 'aaa', text: 'aaaaa',
        category: 'カテゴリ', item_status: '美品', delivery_fee: '元払い', prefecture: 'ハワイ',
        dateship_standard: '30日', price: '1000')
        expect(@item).to be_valid
      end
      it "価格の範囲が¥300~¥9,999,999の間であれば投稿できる" do
        @item.price = '1200'
        expect(@item).to be_valid
      end
      it "ログインしているユーザーだけが、出品ページへ遷移できれば投稿できる" do
        visit index_new_path
        expect(@item).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it '画像が空だと投稿できない' do
        @item.image = nil
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと投稿できない' do
        @item.title = nil
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと投稿できない' do
        @item.text = nil
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが---だと投稿できない' do
        @item.category = nil
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の状態が---だと投稿できない' do
        @item.item_status = nil
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it '配送料の負担が---だと投稿できない' do
        @item.delivery_fee = nil
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it '発送元の地域が---だと投稿できない' do
        @item.prefecture = nil
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '発送までの日数が---だと投稿できない' do
        @item.image = nil
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
      it '価格が空だと投稿できない' do
        @item.price = nil
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格設定が範囲内でなければ投稿できない' do
        @item.price = '210'
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格が半角英数字でなければ投稿できない' do
        @item.price = '５０００' 
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end
