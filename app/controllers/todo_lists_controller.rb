# frozen_string_literal: true

class TodoListsController < ApplicationController
  def show
    render json: fetch_todo_list, include: [:todos]
  end

  def create
    todo_list = fetch_todo_list

    if todo_list.save
      title = todo_list.title

      flash[:notice] = "Todo list: #{title} created!"
      redirect_to URI.parse("/#{title}").path
    else
      flash[:error] = 'An error has ocurred, todo list not created'
      redirect_to :back
    end
  end

  private

  def fetch_todo_list
    TodoList.first
  end

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
