class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])

  end

  def create
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = current_user
    puts @booking.valid?
    if @booking.save

      # redirect_to booking_path(@booking), notice: 'Congrats, enjoy the walk!!'
      redirect_to root_path, notice: 'Congrats, enjoy the walk!!'
    else
      puts @booking.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  # def book
  #   @dog = Dog.find(params[:id])
  #   @dog.book
  #   redirect_to @dog
  # end

  private

  def booking_params
    params.require(:booking).permit(:date, :comment, :dog_id, :user_id)
  end
end
