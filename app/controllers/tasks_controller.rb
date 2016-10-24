class TasksController < ApplicationController
  before_action :require_login
  before_action :find_task, except: [:index, :new, :create]

  def index
    if session[:user_id].nil?
      redirect_to root_path
      return
    end
    # @user = User.find(session[:user_id])
    @tasks_list = @user.tasks
    # puts "These are the params: #{params}"
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.new(task_params)
    # @task.user_id = @user.id

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def status
    if params[:status] == "incomplete"
      @task.completed = false
    end

    if params[:status] == "complete"
      @task.completed = true
    end

    if @task.save
      redirect_to tasks_path
    else
      render :edit
    end
  end
  # if task_params[:completed] == true
  #    task_params[:completed_at] = DateTime.now
  # else
  #    task_params[:completed_at] = nil
  # end

  # def completed
  #   @task = Task.find(params[:id])
  #   @task.complete_toggle(params[:id])
  #
  #   redirect_to tasks_path
  # end

  def destroy
    @task.destroy

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

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to see tasks" #this only shows if you tell it to show
      redirect_to root_path
    end
  end

  def find_task
    @check_task = Task.find(params[:id])
    if @check_task.user_id == @user.id
      @task = @check_task
    else
      flash[:error] = "You are not allowed to view another user's tasks."
      redirect_to root_path
    end
  end
end
