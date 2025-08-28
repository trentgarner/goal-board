class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1/edit
  def edit
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.turbo_stream
        format.html { redirect_to lists_path, notice: "Task created." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("new_list", partial: "form", locals: { list: @list })
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path, notice: "List was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: "Task has been removed from list"
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:description, :completed)
  end
end
