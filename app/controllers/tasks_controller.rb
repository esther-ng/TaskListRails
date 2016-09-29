class TasksController < ApplicationController
  def index

    @tasks_list = Task.all

    puts "These are the params: #{params}"

  end

  def show
    @task = Task.find(params[:id])

    @completed = "Completed" if @task.completed == true

    @completed = "Incomplete" if @task.completed == false

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    Task.find(params[:id]).destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed, :completed_at)
  end
end
