require "name_generator"

class HomeController < ApplicationController
  # GET /home
  def index
    title = NameGenerator.instance.name
    @todo = Todo.new title: title

    render json: { todo: @todo }
  end
end
