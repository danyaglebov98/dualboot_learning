require 'test_helper'

class Web::PasswordResetsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end
  test 'should post create' do
    user = create(:user)
    email = user.email
    assert_emails 1 do
      post :create, params: { reset_form: { email: email } }
    end
    assert_response :success

    user.reload
    assert user.password_reset_token.present?
    assert user.password_reset_sent_at.present?
  end

  test 'should get edit' do
    user = create(:user)
    user.generate_password_reset
    get :edit, params: { id: user.password_reset_token }
    assert_response :success
    assert_template :edit
  end

  test 'get edit should return error' do
    user = create(:user)
    user.generate_password_reset
    user.update(password_reset_sent_at: 25.hours.ago)
    get :edit, params: { id: user.password_reset_token }
    assert_response :success
    assert_template :give_an_error_message
  end

  test 'put update should redirect_to new_session' do
    user = create(:user)
    user.generate_password_reset
    put :update, params: { id: user.password_reset_token, developer: { password: generate(:string) } }
    user.del_password_reset_token_and_sent_at
    assert_response :redirect
    assert_nil user.password_reset_token
  end

  test 'put update should return error' do
    user = create(:user)
    user.generate_password_reset
    user.update(password_reset_sent_at: 25.hours.ago)
    put :update, params: { id: user.password_reset_token, developer: { password: generate(:string) } }
    assert_response :success
    assert_template :give_an_error_message
  end
end
