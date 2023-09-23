require 'rails_helper'

RSpec.describe PostForm, type: :model do
  describe '投稿' do
    before do
      category = FactoryBot.create(:category) # FactoryBot未作成
      tag = FactoryBot.create(:tag) # FactoryBot未作成
      user = FactoryBot.create(:user)
      @post_form = FactoryBot.build(:post_form, category_id: category.id, tag_id: tag.id, user_id: user.id)
      sleep(0.1)
    end
  # 続きここから
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@post_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できない' do
        @order_purchaser.post_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_purchaser.post_code = '1234567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idを選択していないと保存できない' do
        @order_purchaser.prefecture_id = '1'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @order_purchaser.city = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @order_purchaser.address = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは半角数字出なければ保存できない' do
        @order_purchaser.phone_number = '０９０１２３４５６７８'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以下では保存できない' do
        @order_purchaser.phone_number = '09012345'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは12桁以上では保存できない' do
        @order_purchaser.phone_number = '0901234567890'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では保存できない' do
        @order_purchaser.token = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Token can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_purchaser.item_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @order_purchaser.user_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end