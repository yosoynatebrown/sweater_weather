class Books
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(data, destination, forecast)
    @id = nil
    @destination = destination
    @forecast = forecast_attributes(forecast)
    @total_books_found = data[:numFound]
    @books = book_attributes(data[:docs])
  end

  def book_attributes(books)
    books.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def forecast_attributes(forecast)
    {
      summary: forecast[:conditions],
      temperature: forecast[:temperature].to_s + ' F'
    }
  end
end
