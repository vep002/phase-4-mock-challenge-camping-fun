class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

  def index 
    render json: Activity.all
  end 

  def destroy 
    activity = Activity.find(params[:id])
    activity.destroy 
    # if activity
    #   activity.destroy
    # else 
    #   render json: { error: "Activity not found" }, status: :not_found
    # end 

  end 

  private 
    def error_not_found
      render json: { error: "Activity not found" }, status: :not_found
    end 
end
