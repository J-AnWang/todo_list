class TasksController < ApplicationController
    before_action :find_params, only: [:show, :edit, :update, :check]

    def index
      @tasks = Task.order(date: :asc)
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
          flash[:notice] = 'Successfully Created'
          redirect_to action: :index
      else
          render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @task.update_attributes(task_params)
          flash[:notice] = 'Successfully Updated'
          redirect_to tasks_path(@task)
      else
          render :edit
      end
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = 'Successfully Deleted'
      redirect_to tasks_url
    end

    def check
      if @task.status == false
          @task.status = true
          @task.update_attributes(check_update)
      else
          @task.status = false
          @task.update_attributes(check_update)
      end

      redirect_to action: :index
    end

    private

    def task_params
      params.require(:task).permit(:name, :date, :note)
    end

    def check_update
      params.permit(:status)
    end

    def find_params
      @task = Task.find(params[:id])
    end
end
