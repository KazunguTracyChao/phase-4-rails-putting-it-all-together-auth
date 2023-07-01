class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    before_action :authorize
    def index
      recipes = Recipe.all
      render json: recipes, status: :created
    end
  
    def create
      recipe = Recipe.create(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user_id:session[:user_id])
      if recipe.valid?
      render json: recipe, status: :created
      else
      render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
      end
    end
  
    private
    def authorize
      render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
  
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end
  
    def render_unprocessable_entity(e)
      render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end
  
  end