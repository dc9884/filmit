class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @usermovies = Movie.where(:user_id => current_user.id)

    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])

    render("movies/show.html.erb")
  end

  def new
    @movie = Movie.new

    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.description = params[:description]
    @movie.production_id = params[:production_id]
    @movie.user_id = params[:user_id]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit
    @movie = Movie.find(params[:id])

    render("movies/edit.html.erb")
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.description = params[:description]
    @movie.production_id = params[:production_id]
    @movie.user_id = params[:user_id]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie updated successfully.")
    else
      render("movies/edit.html.erb")
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    if URI(request.referer).path == "/movies/#{@movie.id}"
      redirect_to("/", :notice => "Movie deleted.")
    else
      redirect_to(:back, :notice => "Movie deleted.")
    end
  end
end
