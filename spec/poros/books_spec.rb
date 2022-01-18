require 'rails_helper'

describe Books do
  it 'has attributes' do
    books = Books.new(books_data, 'Denver, CO', current_forecast_data)

    expect(books.id).to eq(nil)
    expect(books.destination).to eq('Denver, CO')
    expect(books.forecast).to be_a Hash
    expect(books.forecast[:temperature]).to eq('43.48 F')
    expect(books.forecast[:summary]).to eq('overcast clouds')
    expect(books.total_books_found).to eq(652)
    expect(books.books).to be_an Array
    expect(books.books.first[:title]).to eq('Denver, Co')
  end
end
