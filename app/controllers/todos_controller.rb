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
    @todo = Todo.create todo_params

    if @todo.save
      redirect_to @todo, notice: "Todo list: #{@todo.id} created!"
    else
      redirect_to :back, error: "An error has ocurred, todo list not created"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
