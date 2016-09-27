class TasksController < ApplicationController
  def index

    @tasks_list = [
      "Buy milk",
      "Go to gym",
      "Walk dog"
    ]

    puts "These are the params: #{params}"

  end

  def show
    @id = params[:id].to_i
    @tasks_list = [
      {
        name:"Buy milk",
        description: "Go to store and buy milk",
        completion_status: "Outstanding",
        completion_date: "TBD"
      },
      {
        name: "Go to gym",
        description: "Go work out and stop being lazy",
        completion_status: "Outstanding",
        completion_date: "TBD"
      },
      {
        name: "Walk dog",
        description: "The dog is getting fat. Please walk it already.",
        completion_status: "Complete",
        completion_date: Date.new
      }
    ]
  end
end
