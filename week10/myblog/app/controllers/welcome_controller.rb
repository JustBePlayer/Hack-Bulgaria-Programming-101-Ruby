class WelcomeController < ApplicationController
  def index
    @bag = {}.tap do |hash|
      hash[:posts] = Post.all
      hash[:photos] = Photo.all
    end
  end
end
