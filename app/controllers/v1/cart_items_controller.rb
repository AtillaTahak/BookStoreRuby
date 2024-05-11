class V1::CartItemsController < ApplicationController
	before_action :authorized

	def list
		@cart_items = CartItem.where(user_id: current_user.id).all
		render json: @cart_items, status: :ok
	end

	def create
		if current_user.nil?
			render json: { message: "User doesn't exist" }, status: :unauthorized
		end
		# Check if item already exists in cart and update quantity
		@cart_item = CartItem.find_by(user_id: current_user.id, book_id: params[:book_id])
		if @cart_item
			@cart_item.update(quantity: @cart_item.quantity + params[:quantity])
			render json: @cart_item, status: :ok
			return
		else
			@cart_item = CartItem.new(user_id: current_user.id, book_id: params[:book_id], quantity: params[:quantity])
			if @cart_item.save
				render json: @cart_item, status: :created
			else
				render json: @cart_item.errors, status: :unprocessable_entity
			end
		end
	end


	def update
		@cart_item = CartItem.find(user_id: current_user.id, book_id: params[:book_id])
		if @cart_item.update(quantity: params[:quantity])
			render json: @cart_item, status: :ok
		else
			render json: @cart_item.errors, status: :unprocessable_entity
		end
	end


	def delete
		@cart_item = CartItem.find(user_id: current_user.id, book_id: params[:book_id])
		@cart_item.destroy
		render json: { message: "Item removed from cart" }, status: :ok
	end
end
