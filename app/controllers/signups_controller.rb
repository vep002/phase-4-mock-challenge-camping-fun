class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :invalid_data

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    def signup_params
        params.require(:signup).permit(:activity_id, :camper_id)
    end

    def invalid_data(exception)
        render json: {errors: exception.errors.full_messages}, status: 422
    end
end
