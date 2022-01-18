class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].nil?
      books = LibraryFacade.book_search(params[:location])

      render json: BooksSerializer.new(books)
    elsif params[:quantity].to_i > 0
      books = LibraryFacade.book_search(params[:location], params[:quantity])

      render json: BooksSerializer.new(books)
    else
      render json: { message: 'Quantity cannot be less than 1' }, status: 400
    end
  end
end
