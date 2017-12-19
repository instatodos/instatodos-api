require 'name_generator'

class HomeController < ApplicationController
  def index
    title = NameGenerator.instance.name
    @todo_list = TodoList.new title: title

    render json: { todo_list: @todo_list }
  end
end
