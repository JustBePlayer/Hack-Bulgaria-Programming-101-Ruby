class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
    redirect_to @lecture
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update(lecture_params)
      redirect_to @lecture
    else
      redirect_to action: 'index'
    end
  end

  def destroy
    Lecture.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private

  def lecture_params
    params.require(:lecture).permit(:name, :body)
  end
end
