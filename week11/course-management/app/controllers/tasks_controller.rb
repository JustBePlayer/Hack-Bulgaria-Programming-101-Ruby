class TasksController < ApplicationController
  def index
    @tasks = Lecture.find(params[:lecture_id]).tasks
  end

  def new
    #@task = Task.new
    #@task.lecture = Lecture.find(params[:lecture_id])
    @lecture = Lecture.find(params[:lecture_id])
    @task = @lecture.tasks.new

    #@task = Lecture.find(params[:lecture_id]).tasks.new
    #task.lecture = Lecture.find(params[:lecture][:id])
  end

  def edit
    @task = Task.find(params[:id])
    @lecture = @task.lecture
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to [@task.lecture, @task]
    else
      redirect_to action: 'index'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.lecture = Lecture.find(params[:lecture_id])
    if @task.save
      redirect_to [@task.lecture, @task]
    else
      redirect_to action: 'index'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: 'index'
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
