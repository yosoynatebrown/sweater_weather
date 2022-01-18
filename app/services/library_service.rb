class LibraryService
  def self.book_search(term, quantity)
    conn = get_url(url: 'http://openlibrary.org')

    response = conn.get("/search.json?q=#{term}&limit=#{quantity}")

    JSON.parse(response.body, symbolize_names: true)
  end

    private
    def self.get_url(url)
      Faraday.new(url)
    end
end