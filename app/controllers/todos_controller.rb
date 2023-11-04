class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.order(:created_at)
    if params[:scope].in?(%w[active completed])
      @todos = @todos.public_send(params[:scope])
    end
  end

  # GET /todos/1.json
  def show
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_back_or_to todos_url }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { redirect_back_or_to todos_url }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_back_or_to todos_url }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/toggle or /todos/toggle.json
  def toggle
    Todo.toggle_all!

    respond_to do |format|
      format.html { redirect_back_or_to todos_url }
      format.json { render json: Todo.all }
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_back_or_to todos_url }
      format.json { head :no_content }
    end
  end

  # DELETE /todos/completed or /todos/completed.json
  def destroy_completed
    Todo.completed.delete_all

    respond_to do |format|
      format.html { redirect_back_or_to todos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :completed)
    end
end
