class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'secret', 'HS256')
    end

    def decoded_token
        header = request.headers['Authorization']
        if header
            token = header.split(" ")[0]
            begin
				JWT.decode(token, 'secret','HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

	def kill_token
		header = request.headers['Authorization']
		@user = User.find_by(token: header)
		User.update(@user.id, token: nil)
	end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorized
		header = request.headers['Authorization']
		if(header.present?)
			@user = User.find_by(token: header)
			if !@user.present?
				render json: { message: 'Please log in' }, status: :unauthorized
			end
			unless !!current_user
				render json: { message: 'Please log in' }, status: :unauthorized
			end
		else
			render json: { message: 'Please log in' }, status: :unauthorized
		end
    end
end
