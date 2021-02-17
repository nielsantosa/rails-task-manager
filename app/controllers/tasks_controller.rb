class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    strong_params = params.require(:task).permit(:title, :details)

    @task = Task.new(strong_params)
    if @task.save!
      redirect_to task_path(@task.id)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    strong_params = params.require(:task).permit(:title, :details, :completed)

    if @task.update(strong_params)
      redirect_to task_path(@task.id)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
    end
  end
end
