require "name_generator"

class HomeController < ApplicationController
  # GET /home
  def index
    title = NameGenerator.name
    @todo = Todo.new title: title

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
