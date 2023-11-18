class DogsController < ApplicationController
  def index
    if params[:query].present?
      sql_subquery = <<~SQL
        dogs.name @@ :query
      SQL
      @dogs = Dog.all.joins(:user).where(sql_subquery, query: params[:query])
    else
      @dogs = Dog.all
    end

    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {dog: dog})
      }
    end
  end


  def new
    if current_user
      @dog = Dog.new
    else
      redirect_to new_user_session_path
    end
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

# def book
#   # I need to be able to change the booked state from false to true
#   @dog = Dog.find(params[:id])
#   @dog.book
#   redirect_to @dog
# end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :location, :photo, :user_id)
  end
end
