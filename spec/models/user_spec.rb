require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}
  it { should have_many :answers }
  it { should have_many :questions }

  describe '.find_for_oauth' do
    let!(:user) { create(:user) }
    let(:auth) { OmniAuth::AuthHash.new(provider: 'facebook', uid: '12345678')}
    context 'Користувач вже має авторизацію' do
      it 'повертаємо користувача' do
        user.authorizations.create(provider: 'facebook', uid: '12345678')
        expect(User.find_for_oauth(auth)).to eq user
        end
      context 'юзер не має авторизації' do
        context 'користувач вже існує' do
          let(:auth) { OmniAuth::AuthHash.new(provider: 'facebook', uid: '12345678', info: { email: user.email }) }
          it 'не створювати нового користувача' do
            expect{ User.find_for_oauth(auth) }.to_not change(User, :count)
          end
          it 'створюється авторизація для користувача' do
            expect{ User.find_for_oauth(auth) }.to change(user.authorizations, :count).by(1)

          end
          it 'створення авторизації з провайдером і юайді' do
            user = User.find_for_oauth(auth)
            authorization = user.authorizations.first

            expect(authorization.provider).to eq auth.provider
            expect(authorization.uid).to eq auth.uid
          end
          it ' gовернення користувача' do
            expect(User.find_for_oauth(auth)).to eq user
          end
        end
      end
    end
  end
end
