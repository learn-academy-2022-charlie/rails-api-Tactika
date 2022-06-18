class SightingsController < ApplicationController
  # Index API Method - Show all Sightings
  def index
    sightings = Sighting.all

    if sightings
      render json:sightings
    else
      render json:sightings.errors
    end
  end

  def show
    sighting = Sighting.find(params[:id])

    if sighting.valid?
      render json:sighting
    else
      render json:sighting.errors
    end
  end
  # Create API Method - Create a single
  def create
    sighting = Sighting.new(sighting_params)
    if sighting.save
      render json:sighting
    else
      render json:sighting.errors
    end
  end
  # Update API Method - Update a record using ID
  def update
    sighting = Sighting.find(params[:id])
    if sighting.update(sighting_params)
      render json:sighting
    else
      render json:sighting.errors
    end
  end
  # Delete API Method - Delete one sighting by ID
  def destroy
    sighting = Sighting.find(params[:id])
    if sighting.delete.valid?
      render json:sighting
    else
      render json:sighting.errors
    end
  end
  # Validation Method
  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id)

  end
end
