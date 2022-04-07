class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_error_create

  def index 
    render json: Camper.all
  end 

  def show 
    camper = Camper.find_by(id: params[:id])
    if camper 
      render json: camper, serializer: CamperWithActivity
    else 
      render json: { error: 'Camper not found'}, status: 404
    end 
  end 

  def create 
    camper = Camper.create!(camper_params)
      render json: camper, status: 201
  end 

  private 

  def camper_params 
    params.permit(:name, :age)
  end 

  def render_error_create
    render json: { errors: ["validation errors"] }, status: 422
  end 

end








# react makes fetch request => goes through the internet ethos => gets to our api => route matches our controller => controller fires proper action => (render json) => rails will try to take ruby object, convert to json (WITHOUT our own serializer, rails uses its own interal. WITH our own serializer, rails sees what we request to put into json, and excludes ANYTHING not specified)