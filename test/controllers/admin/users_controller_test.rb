# frozen_string_literal: true

require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    admin = create(:admin)
    sign_in(admin)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    user = create(:user)
    get :edit, params: { id: user.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    user_attrs = attributes_for(:user)
    post :create, params: { user: user_attrs }
    assert_response :redirect
    new_user = User.find_by(email: user_attrs[:email])

    assert new_user.present?
    assert new_user[:first_name] == user_attrs[:first_name]
    assert new_user[:last_name] == user_attrs[:last_name]
    assert new_user[:type] == user_attrs[:type]
  end

  test 'should patch update' do
    user = create(:user)
    user_attrs = attributes_for(:user)
    patch :update, params: { id: user.id, user: user_attrs }
    assert_response :redirect
    updated_user = User.find_by(email: user_attrs[:email])

    assert updated_user[:first_name] == user_attrs[:first_name]
    assert updated_user[:last_name] == user_attrs[:last_name]
    assert updated_user[:type] == user_attrs[:type]
  end

  test 'should delete destroy' do
    user = create(:user)
    delete :destroy, params: { id: user.id }
    assert_response :redirect
    refute User.exists?(user.id)
  end
end
