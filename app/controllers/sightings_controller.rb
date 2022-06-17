class SightingsController < ApplicationController
  def index
    sightings = Sighting.all

    if sightings
      render json:sightings
    else
      render json:sightings.errors
    end
  end
end
