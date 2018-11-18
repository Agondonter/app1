require 'rails_helper'

describe UsersController,type: :controller do
  let(:user) { User.create!(email: "example@example.com", password: "example") }
  let(:user2) { User.create!(email: "another_example@example.com", password: "another_example" ) }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
      	sign_in user
      end
        it 'loads correct user details' do
          get :show, params: { id: user.id }
          expect(response).to be_ok
          expect(assigns(:user)).to eq user
        end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
      	get :show, params: { id: user.id }
      	expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user1 cannot access user2 show page' do
      before do
      	sign_in user
      end
        it 'redirects user1 to login' do
          get :show, params: { id: user2.id }
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_user_session_path)
        end
    end
  end
end