class TodosController < ApplicationController
  # GET /todos/:id
  def show
    @todo = Todo.friendly.find params[:id]
    render json: @todo.as_json(include: :tasks)
  end

  # POST /todos
  def create
    @todo = Todo.create todo_params

    if @todo.save
      redirect_to "/#{@todo.title}",
                  notice: "Todo list: #{@todo.title} created!"
    else
      redirect_to :back, error: "An error has ocurred, todo list not created"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
