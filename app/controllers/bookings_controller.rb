class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dog =
    @booking.user = current_user
    if @booking.save
      redirect_to @booking, notice 'Congrats, enjoy the walk!!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @booking = Booking.all
  end

  def book
    @dog = Dog.find(params[:id])
    @dog.book
    redirect_to @dog
  end

private

def booking_params
  params.require(:booking).permit(:date, :comment, :dog_id)
end

end
