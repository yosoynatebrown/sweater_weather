require 'rails_helper'

describe 'Book search API' do
  it 'returns a list of books when given valid params', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)
    
    expect(books).to have_key(:data)
    expect(books[:data][:type]).to eq('books')
    expect(books[:data]).to have_key(:attributes)
    expect(books[:data][:attributes]).to have_key(:total_books_found)
    expect(books[:data][:attributes]).to have_key(:books)
    expect(books[:data][:attributes][:books].length).to eq(5)
    expect(books[:data][:attributes]).to have_key(:destination)
    expect(books[:data][:attributes]).to have_key(:forecast)
  end

  it 'returns a an error when quantity is 0', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=0'

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:message)
    expect(error[:message]).to eq('Quantity cannot be less than 1')
  end

  it 'defaults to a quantity of 5 if quantity is not present', :vcr do
    get '/api/v1/book-search?location=denver,co'

    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books).to have_key(:data)

    expect(books[:data][:attributes][:books].length).to eq(5)
  end
end