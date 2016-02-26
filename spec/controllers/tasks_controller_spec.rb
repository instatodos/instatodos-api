require 'rails_helper'

describe TasksController, :type => :controller do
  let(:valid_attributes) {
    {title: 'task', description: 'description', completed: true}
  }

  let(:invalid_attributes) {
    {title: ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      task = Task.create! valid_attributes
      get :index, {format: :json}, valid_session
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {format: :json, :task => valid_attributes}, valid_session
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {format: :json, :task => valid_attributes}, valid_session
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved task as @task" do
        post :create, {format: :json, :task => invalid_attributes}, valid_session
        expect(assigns(:task)).to be_a_new(Task)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: 'task', description: 'description', completed: true}
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        put :update, {format: :json, :id => task.to_param, :task => new_attributes}, valid_session
        task.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested task as @task" do
        task = Task.create! valid_attributes
        put :update, {format: :json, :id => task.to_param, :task => valid_attributes}, valid_session
        expect(assigns(:task)).to eq(task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        task = Task.create! valid_attributes
        put :update, {format: :json, :id => task.to_param, :task => invalid_attributes}, valid_session
        expect(assigns(:task)).to eq(task)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, {format: :json, :id => task.to_param}, valid_session
      }.to change(Task, :count).by(-1)
    end
  end
end
