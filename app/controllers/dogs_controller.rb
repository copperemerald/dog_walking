class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end


  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to @dog, notice: 'Dog was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :location, :photo, :user_id)
  end
end


