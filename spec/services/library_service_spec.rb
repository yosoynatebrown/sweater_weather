require 'rails_helper'

RSpec.describe 'Open Library search' do
  it 'can find books by search term', :vcr do
    response = LibraryService.book_search('Denver,CO', 5)

    expect(response).to be_a Hash
    expect(response).to have_key(:numFound)
    expect(response[:numFound]).to be_a(Integer)

    expect(response).to have_key(:docs)

    first_result = response[:docs][0]

    expect(first_result).to have_key :title
    expect(first_result[:title]).to be_a String

    expect(first_result).to have_key :isbn
    expect(first_result[:isbn]).to be_an Array
  end
end
