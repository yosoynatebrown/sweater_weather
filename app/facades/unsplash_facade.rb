class UnsplashFacade
  def self.image(search)
    response = UnsplashService.images(search)
    require 'pry'; binding.pry
    image = response[:results][0][:locations][0][:latLng]

    Image.new(image)
  end
end