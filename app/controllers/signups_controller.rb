class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_data

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def invalid_data(exception)
        render json: {errors: exception.record.errors.full_messages}, status: 422
    end
end
