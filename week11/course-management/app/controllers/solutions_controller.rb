class SolutionsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @solution = @task.solutions.new
  end

  def index
    @solutions = Task.find(params[:task_id]).solutions.all
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def create
    @solution = Solution.new(solution_params)
    @solution.task = Task.find(params[:task_id])
    if @solution.save
      redirect_to [@solution.task.lecture, @solution.task, @solution]
    else
      redirect_to action: 'index'
    end
  end

  def edit
    @solution = Solution.find(params[:id])
    @task = @solution.task
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update(solution_params)
      redirect_to [@solution.task.lecture, @solution.task, @solution]
    else
      redirect_to action: 'index'
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to action: 'index'
  end

  private

  def solution_params
    params.require(:solution).permit(:textblock)
  end
end
