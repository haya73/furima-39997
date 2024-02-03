require 'rails_helper'

RSpec.describe OrdersAddresses, type: :model do

  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user: user)
      @orders_addresses = FactoryBot.build(:orders_addresses, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@orders_addresses).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @orders_addresses.building = ''
        expect(@orders_addresses).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @orders_addresses.post_code = ''
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @orders_addresses.post_code = '1234567'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @orders_addresses.prefecture_id = 1
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @orders_addresses.city = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @orders_addresses.address = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが10桁以下だと保存できないこと' do
        @orders_addresses.telephone_number = '1234567'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Telephone number は10桁以上11桁以内の数字で入力してください")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @orders_addresses.telephone_number = '123451234512345'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Telephone number は10桁以上11桁以内の数字で入力してください")
      end
      it 'telephone_numberが半角数値以外では保存できないこと' do
        @orders_addresses.telephone_number = '魔苦怒奈流怒'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Telephone number は10桁以上11桁以内の数字で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @orders_addresses.user_id = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @orders_addresses.token = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
