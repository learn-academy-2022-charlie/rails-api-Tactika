class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    if animals
      render json:animals
    else
      render json:animals.errors
    end
  end
end
