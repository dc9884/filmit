class PermitsController < ApplicationController
  def index
    @permits = Permit.all

    render("permits/index.html.erb")
  end

  def show
    @permit = Permit.find(params[:id])

    render("permits/show.html.erb")
  end

  def new
    @permit = Permit.new

    render("permits/new.html.erb")
  end

  def create
    @permit = Permit.new

    @permit.movie_id = params[:movie_id]
    @permit.location_id = params[:location_id]
    @permit.booked_time = params[:booked_time]
    @permit.user_id = params[:user_id]

    save_status = @permit.save

    if save_status == true
      redirect_to("/permits/#{@permit.id}", :notice => "Permit created successfully.")
    else
      render("permits/new.html.erb")
    end
  end

  def edit
    @permit = Permit.find(params[:id])

    render("permits/edit.html.erb")
  end

  def update
    @permit = Permit.find(params[:id])

    @permit.movie_id = params[:movie_id]
    @permit.location_id = params[:location_id]
    @permit.booked_time = params[:booked_time]
    @permit.user_id = params[:user_id]

    save_status = @permit.save

    if save_status == true
      redirect_to("/permits/#{@permit.id}", :notice => "Permit updated successfully.")
    else
      render("permits/edit.html.erb")
    end
  end

  def destroy
    @permit = Permit.find(params[:id])

    @permit.destroy

    if URI(request.referer).path == "/permits/#{@permit.id}"
      redirect_to("/", :notice => "Permit deleted.")
    else
      redirect_to(:back, :notice => "Permit deleted.")
    end
  end
end
