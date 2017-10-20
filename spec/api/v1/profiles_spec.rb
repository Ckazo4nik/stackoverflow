require 'rails_helper'

describe 'Profile API' do
  describe "GET /me" do
    context 'неавторизований' do
      it 'поверення статусу 401, якщо немає аксес токену' do
        get '/api/v1/profiles/me',params: { format: :json}
        expect(response.status).to eq 401
      end
      it 'поверення статусу 401, якщо аксес токен є неправильний' do
        get '/api/v1/profiles/me',params: { format: :json, access_token: '1234'}
        expect(response.status).to eq 401
      end
    end
    
  end

end