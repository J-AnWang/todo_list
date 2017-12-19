class TasksController < ApplicationController
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
      @task = Task.find(params[:id])
    end

    def edit
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find(params[:id])
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

      redirect_to tasks_url
    end

    def check
      @task = Task.find(params[:id])

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
end
