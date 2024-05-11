class V1::AuthController < ApplicationController
	before_action :authorized, except: [:login]
	rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
	def login
		@user = User.find_by(username: login_params[:username])
		if @user.nil?
			render json: {error: 'User not found'} , status: :unprocessable_entity
			return
		end
		if @user.authenticate(login_params[:password])
			@token = encode_token(user_id: @user.id)
			User.update(@user.id, token: @token)
			render json:{
				user: UserSerializer.new(@user),
				token: @token
			}
		else
			render json: {error: 'Invalid username or password'}, status: :unprocessable_entity
		end
	end

	def logout
		kill_token
		render json: {message: 'Logged out successfully'}
	end

	private
	def login_params
		params.require(:auth).permit(:username, :password)
	end

    def handle_record_not_found()
        render json: { message: "User doesn't exist" }, status: :unauthorized
    end

  end
