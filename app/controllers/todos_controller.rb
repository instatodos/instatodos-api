class TodosController < ApplicationController
  # GET /todos/:id
  def show
    @todo = Todo.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo.as_json(include: :tasks) }
    end
  end

  # POST /todos
  def create
    @todo = Todo.new title: :example
    if @todo.save
      respond_to do |format|
        format.html { redirect_to @todo, notice: 'Todo created' }
      end
    end
  end
end
