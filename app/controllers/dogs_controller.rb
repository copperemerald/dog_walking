class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to @dog, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :location, :photo)
  end
end
