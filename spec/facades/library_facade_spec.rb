require 'rails_helper'

RSpec.describe 'Library Facade' do
  it '.book_search', :vcr do
    books = LibraryFacade.book_search('Denver, CO', 10)

    expect(books).to be_a Books
  end
end