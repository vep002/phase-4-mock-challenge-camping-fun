class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_data

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitySerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    def not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def camper_params
        params.require(:camper).permit(:name, :age)
    end

    def invalid_data(exception)
        render json: {errors: exception.errors.full_messages}, status: 422
    end

end
