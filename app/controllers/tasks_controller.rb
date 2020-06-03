class TasksController < ApplicationController
  before_action :set_user
  
  def index
   @tasks = Task.all
   
  end

  def show

  end
  
  def new
   @task = Task.new
  end
  
 def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end  
 end
 
 private
 
 def task_params
   params.require(:task).permit(:name, :description)
 end  
 
 def set_user
   @user = User.find(params[:user_id])
 end 
 
 def correct_task
    redirect_to(root_url) unless current_task?(@task)
 end  
 
 def edit
   @task = Task.find(params[:id])
 end  
  
 def update
   @task = Task.find(params[:id])
    if @task.use_tasks(task_params)
    else
      render :edit
    end 
 end    
end
