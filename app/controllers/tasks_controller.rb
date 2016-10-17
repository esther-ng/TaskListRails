class TasksController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to root_path
      return
    end
    @user = User.find_by(session[:user_id])
    @tasks_list = @user.tasks
    # puts "These are the params: #{params}"
  end

  def show
    @task = Task.find(params[:id])
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if task_params[:completed] == "1"
       task_params[:completed_at] = DateTime.now
    else
       task_params[:completed_at] = nil
    end

    @task.update(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :edit
    end
  end

  # def completed
  #   @task = Task.find(params[:id])
  #   @task.complete_toggle(params[:id])
  #
  #   redirect_to tasks_path
  # end

  def destroy
    Task.find(params[:id]).destroy

    redirect_to tasks_path
  end

  private
  #
  # def toggle_completion
  #   if @task.completed
  #     @task.completed = false
  #     @task.completed_at = nil
  #   else
  #     @task.completed = true
  #     @task.completed_at = DateTime.now
  #   end
  # end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :completed_at)
  end

end
