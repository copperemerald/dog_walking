class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(list_params)
    if @dog.save
      redirect_to @dog, notice: 'Your new pup was successfully added.'
    else
      render :new
    end
  end

def book
  # I need to be able to change the booked state from false to true
  @dog = Dog.find(params[:id])
  @dog.book
  redirect_to @dog
end

  private

  def list_params
    params.require(:dog).permit(:name, :description, :location, :photo, :booked)
  end
end
