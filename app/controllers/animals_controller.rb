class AnimalsController < ApplicationController
  # Index API Endpoint - Return All Animals
  def index
    animals = Animal.all
    if animals
      render json:animals
    else
      render json:animals.errors
    end
  end

  # Show API Endpoint - Return Animal by ID
  def show
    animal = Animal.find(params[:id])
    if animal
      render json:animal
    else
      render json:animal.errors
    end
  end

  # Update API Endpoint - Update & Return Animal by ID
  def update
    animal = Animal.find(params[:id])

    if animal.update(animal_params)
      render json:animal
    else
      render json:animal.errors
    end
  end

  # Destroy API Endpoint - Destroy Animal by ID
  def destroy
    animal = Animal.find(params[:id])

    if animal.valid?
      animal.destroy
      render json:animal
    else
      render json:animal.errors
    end
  end

  # Create API Endpoint - Create an Animal
  def create
    animal = Animal.new(animal_params)
    if animal.save
      render json:animal
    else
      render json:animal.errors
    end
  end

  private
  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end
end
