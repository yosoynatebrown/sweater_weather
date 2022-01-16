class UnsplashFacade
  def self.image(search)
    response = UnsplashService.images(search)

    image = response[:results][0]

    Image.new(search, image)
  end
end