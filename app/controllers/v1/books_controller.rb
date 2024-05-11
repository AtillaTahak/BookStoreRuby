class V1::BooksController < ApplicationController
	before_action :authorized, except: [:list, :show]

	def list
		@books = Book.all
		render json: @books, status: :ok
	end

	def show
		@book = Book.find(params[:id])
		render json: @book, status: :ok
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			render json: @book, status: :created
		else
			render json: @book.errors, status: :unprocessable_entity
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :author, :price, :description, :image_url)
	end
end
