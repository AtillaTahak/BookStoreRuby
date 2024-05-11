require 'test_helper'

class V1::CartItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
	@app_controller = ApplicationController.new
    @user = create(:user)
    @book = create(:book)
    @cart_item = create(:cart_item)
  end


  test 'should create cart item' do
    post v1_cart_items_path, params: { book_id: @book.id, quantity: 2 }, headers: { Authorization: token_for_user(@user) }
    assert_response :created

    json_response = JSON.parse(response.body)
    assert_equal @user.id, json_response['user_id']
    assert_equal @book.id, json_response['book_id']
    assert_equal 2, json_response['quantity']
  end

  test 'should list cart items' do
    get list_v1_cart_items_path, headers: { Authorization: token_for_user(@user) }
    assert_response :ok

    json_response = JSON.parse(response.body)
    assert_equal @user.cart_items.count, json_response.count
  end


  private

  def token_for_user(user)
	token = @app_controller.encode_token(user_id: user.id)
	user.update(token: token)
	token
  end
end
