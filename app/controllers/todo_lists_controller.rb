class TodoListsController < ApplicationController
  def show
    @todo_lst = TodoList.friendly.find params[:id]
    render json: @todo_list.as_json(include: :todos)
  end

  def create
    @todo_list = TodoList.create todo_list_params

    if @todo_list.save
      redirect_to "/#{@todo_list.title}",
                  notice: "Todo list: #{@todo_list.title} created!"
    else
      redirect_to :back, error: "An error has ocurred, todo list not created"
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
