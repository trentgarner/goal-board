class Api::V1::ListsController < ApplicationController
  protect_from_forgery with: :null_session

  # GET /api/v1/goals
  def index
    @lists = ::List.all
    # render json: lists.map{ |l|l.serialized }
    render @lists
  end

  # GET /api/v1/goals/:id
  def show
    list = ::List.find(params[:id])
    render json: list.serialized
  end

  # POST /api/v1/goals
  def create
    list = ::List.new(list_params)
    if list.save
      render json: list, status: :created
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/goals/:id
  def update
    list = ::List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/goals/:id
  def destroy
    list = ::List.find(params[:id])
    list.destroy
    head :no_content
  end

  private

  def list_params
    params.require(:list).permit(:description, :completed)
  end
end
