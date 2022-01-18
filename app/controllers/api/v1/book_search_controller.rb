class Api::V1::BookSearchController < ApplicationController
  def index
    books = LibraryFacade.book_search(params[:location], params[:quantity])

    render json: BooksSerializer.new(books)
  end
end