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
  # Update API Method
  def update
    sighting = Sighting.find(params[:id])
    if sighting.update(sighting_params)
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
