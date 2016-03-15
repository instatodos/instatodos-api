class HomeController < ApplicationController
  # GET /home
  def index
    @todo = Todo.new title: 'test title'
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
