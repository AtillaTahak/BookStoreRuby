require 'test_helper'

class V1::AuthControllerTest < ActionDispatch::IntegrationTest

  test 'should log in user and return token' do
    user = create(:user, username: 'test', password: 'password')
    post v1_auth_login_path, params: { auth: { username: user.username, password: 'password' } }
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal user.id, json_response['user']['id']
    assert_not_nil json_response['token']
  end

  test 'should return error if user not found' do
    post v1_auth_login_path, params: { auth: { username: 'nonexistent', password: 'password' } }
    assert_response :unprocessable_entity

    json_response = JSON.parse(response.body)
    assert_equal 'User not found', json_response['error']
  end

  test 'should return error if invalid username or password' do
    user = create(:user, username: 'test', password: 'password')
    post v1_auth_login_path, params: { auth: { username: user.username, password: 'wrong_password' } }
    assert_response :unprocessable_entity

    json_response = JSON.parse(response.body)
    assert_equal 'Invalid username or password', json_response['error']
  end
end
