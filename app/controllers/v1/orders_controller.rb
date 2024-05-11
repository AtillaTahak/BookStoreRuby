class V1::OrdersController < ApplicationController
	before_action :authorized

	def payment
		# Find all items in cart including book details
		@cart_items = CartItem.where(user_id: current_user.id).includes(:book).all
		# Check if cart is empty
		if @cart_items.empty?
			render json: { message: "Cart is empty" }, status: :unprocessable_entity
			return
		end
		# Calculate total price
		@total = @cart_items.map { |item| item.book.price * item.quantity }.sum
		@order = Order.new(user: current_user, total_price: @total)
		@cart_items.each do |item|
			@orderItem = OrderItem.create(order: @order, book: item.book, quantity: item.quantity, price: item.book.price)
		end
		if @orderItem.save
			@cart_items.destroy_all
			@order.update(status: "completed")
			if @order.save
				render json: @order, status: :created
			else
				render json: @order.errors, status: :unprocessable_entity
			end
		else
			render json: @orderItem.errors, status: :unprocessable_entity
		end
	end
end
