class MoviesController < ApplicationController
  def index
  end
  def create
      @entry = Movie.create!(movie_params)
      if @entry.valid? and @entry.save
        flash[:notice] = "Movie successfully submitted"
      else
        flash.now[:error] = "Could not submit movie!"
      end
      redirect_to action: 'index'
  end

  private
    def movie_params
       params.require(:movie).permit(:title, :year)
    end
end
