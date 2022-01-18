require 'rails_helper'

RSpec.describe 'Library Facade' do
  it '.book_search', :vcr do
    books = LibraryFacade.book_search('Denver, CO', 10)

    expect(books.length).to eq(10)
    books.each do |book|
      expect(book).to be_a Book
    end
  end
end