class TasksController < ApplicationController
  def index

    @tasks_list = Task.all

    puts "These are the params: #{params}"

  end

  def show
    @task = Task.find(params[:id])

    @completed = "Completed" if @task.completed == true

    @completed = "Incomplete" if @task.completed == false
    #   {
    #     name:"Buy milk",
    #     description: "Go to store and buy milk",
    #     completion_status: "Outstanding",
    #     completion_date: "TBD"
    #   },
    #   {
    #     name: "Go to gym",
    #     description: "Go work out and stop being lazy",
    #     completion_status: "Outstanding",
    #     completion_date: "TBD"
    #   },
    #   {
    #     name: "Walk dog",
    #     description: "The dog is getting fat. Please walk it already.",
    #     completion_status: "Complete",
    #     completion_date: Time.new
    #   },
    #   {
    #     name: "Clean house",
    #     description: "The place is filthy and needs a thorough cleaning",
    #     completion_status: "Complete",
    #     completion_date: Time.new
    #   }
    # ]
  end

  def new
    
  end

  def create
    redirect_to tasks_path
  end

  def delete

  end
end
