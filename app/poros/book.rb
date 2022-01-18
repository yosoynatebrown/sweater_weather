class Book
  attr_reader :title,
              :isbn

  def initialize(data)
    @title = data[:title]
    @isbn  = data[:isbn]
  end
end