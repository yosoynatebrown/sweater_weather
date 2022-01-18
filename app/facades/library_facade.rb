class LibraryFacade
  def self.book_search(term, quantity = '5')
    book_data = LibraryService.book_search(term, quantity)
    coordinates = MapquestFacade.coordinates(term)
    forecast = WeatherFacade.forecast(coordinates).current_weather

    Books.new(book_data, term, forecast)
  end
end