require 'rails_helper'

describe 'Book search API' do
  it 'returns a list of books', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books).to have_key(:data)
    expect(books[:data][:type]).to eq('books')
    expect(books[:data]).to have_key(:attributes)
    expect(books[:data][:attributes]).to have_key(:total_books_found)
    expect(books[:data][:attributes]).to have_key(:books)
    expect(books[:data][:attributes]).to have_key(:destination)
    expect(books[:data][:attributes]).to have_key(:forecast)
  end
end