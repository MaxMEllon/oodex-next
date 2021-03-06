# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do
  let(:user) { create :user }
  let(:parameter) do
    {
      params: params
    }
  end

  context 'successful' do
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    it 'expected success sign in' do
      post api_users_sign_in_url, parameter
      expect(response).to have_http_status 200
    end
  end

  context 'faulting' do
    let(:params) { { email: '', password: '' } }

    it 'expected success sign out' do
      post api_users_sign_in_url, parameter
      expect(response).to have_http_status 400
    end
  end
end
