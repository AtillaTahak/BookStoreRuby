class V1::UsersController < ApplicationController
	before_action :authorized , except: [:create]
	rescue_from ActiveRecord::RecordInvalid, with: :handle_record_not_found

	def create
		@user = User.new(user_params)
		if @user.save
		  @token = encode_token(user_id: @user.id)
		  User.update(@user.id, token: @token)
		  render json: {
			  user: UserSerializer.new(@user),
			  token: @token
		  }, status: :created
		else
		  render json: @user.errors, status: :unprocessable_entity
		end
	end

    def me
        render json: current_user, status: :ok
    end

    private

    def user_params
		params.require(:user).permit(:username, :password,:email)
    end

    def handle_record_not_found
        render json: { message: "User doesn't exist" }, status: :unauthorized
    end
end
