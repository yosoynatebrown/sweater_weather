class LibraryFacade
  def self.book_search(term, quantity)
    books = LibraryService.book_search(term, quantity)[:docs]
    
    books.map do |book_data|
      Book.new(book_data)
    end
  end
end