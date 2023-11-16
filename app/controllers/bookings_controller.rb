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
    # puts @booking.valid?
    if @booking.save

      # redirect_to booking_path(@booking), notice: 'Congrats, enjoy the walk!!'
      redirect_to bookings_path #notice: 'Congrats, enjoy the walk!!'
    else
      # puts @booking.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    # @bookings = Booking.all
    @user_bookings = Booking.where(user_id: current_user)
    @dog_bookings = Booking.joins(:dog).where(dogs: { user_id: current_user.id })
  end


  # def book
  #   @dog = Dog.find(params[:id])
  #   @dog.book
  #   redirect_to @dog
  # end

  def show
    @booking = Booking.where(user_id: current_user)
    # @booking = Booking.find(params[:dog_id], [current_user.id]).where(current_user == user_session)
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.dog.user == current_user
      @booking.update(status: 'accepted')
      redirect_to bookings_path, notice: 'Booking accepted.'
    else
      redirect_to bookings_path, alert: 'Not authorized to accept this booking.'
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    if @booking.dog.user == current_user
      @booking.update(status: 'declined')
      redirect_to bookings_path, notice: 'Booking declined.'
    else
      redirect_to bookings_path, alert: 'Not authorized to decline this booking.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comment, :dog_id, :user_id, :status)
  end
end
