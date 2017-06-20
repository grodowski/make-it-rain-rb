# frozen_string_literal: true

module MakeItRain
  # Repository for response images
  class GifRepo
    @gifs = []

    def self.gif_url
      fetch if @gifs.empty?
      @gifs.sample
    end

    def self.fetch
      @gifs = JSON.parse(
        Net::HTTP.get(URI('https://fitztrev.github.io/make-it-rain/gifs.json'))
      )
    end
    private_class_method :fetch
  end
end
