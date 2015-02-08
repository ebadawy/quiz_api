class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if params[:quiz_id]
      @questions = Quiz.find(params[:quiz_id]).questions
    else
      @questions = Question.all
    end
    render json: @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    render json: @question
  end

  # POST /questions
  # POST /questions.json
  def create
    name = params[:question][:name]
    right_answer = params[:question][:right_answer]
    choices = params[:question][:choices]
    
    @question = Question.new({name: name, right_answer: right_answer})

    choices.each do |i|
      choice = Choice.new({text: i[:text]})
      choice.save
      @question.choices << choice
    end

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      head :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    head :no_content
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :right_answer)
    end

    def choices_arr
      params.require(:question).permit(:choices)
    end
end
