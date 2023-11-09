class DogsController < ApplicationController
  def index
    @dogs = Dogs.all
  end
end
