require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
	@app_controller = ApplicationController.new
  end
  test 'should create user and return token' do
    post v1_users_path, params: { user: { username: 'test', password: 'password', email: 'test@example.com' } }
    assert_response :created

    json_response = JSON.parse(response.body)
    assert_equal 'test', json_response['user']['username']
    assert_not_nil json_response['token']
  end

  test 'should return error if user creation fails' do
    post v1_users_path, params: { user: { username: '', password: 'password', email: 'test@example.com' } }
    assert_response :unprocessable_entity

    json_response = JSON.parse(response.body)
    assert_equal ["can't be blank"], json_response['username']
  end
end
