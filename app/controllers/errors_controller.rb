class ErrorsController < ApplicationController
  def not_found
    custom_404_error = {
      "status": 404,
      "message": "Error 404 Not Found.... better luck next try!"
    }
    render json:custom_404_error
  end

  def unprocessable_entity
    custom_422_error = {
      "status": 422,
      "message": "Error 422 Unprocessable Entity.... I understand what your trying to do, but I can't right now!"
    }
    render json:custom_422_error
  end

  def internal_server_error
    custom_500_error = {
      "status": 500,
      "message": "Error 500 Internal Server Error.... looks like we're having some technical difficulties, scotty!"
    }
    render json:custom_500_error
  end
end
