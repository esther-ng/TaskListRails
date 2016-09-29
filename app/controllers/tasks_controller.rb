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

  end

  def create
    Task.create(title: params[:title], description: params[:description], completed: params[:completed], completed_at: params[:completed_at])

    redirect_to tasks_path
  end

  def delete

  end
end
