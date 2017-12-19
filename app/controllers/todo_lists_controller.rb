class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.first
    render json: @todo_list, include: [:todos]
  end

  def create
    @todo_list = TodoList.create todo_list_params

    if @todo_list.save
      title = @todo_list.title
      flash[:notice] = "Todo list: #{title} created!"
      redirect_to URI.parse("/#{title}").path
    else
      flash[:error] = 'An error has ocurred, todo list not created'
      redirect_to :back
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
