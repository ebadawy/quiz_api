class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all

    render json: @quizzes
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    render json: @quiz
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    questions_arr.each do |i|
      question = Question.new(question_params(i))
      choices_arr(i).each do |j|
        choice = Choice.new(choice_params(j))
        choice.save
        question.choices << choice
      end
      @quiz.questions << question
    end

    if @quiz.save
      render json: @quiz, status: :created, location: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])

    if @quiz.update(quiz_params)
      head :no_content
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy

    head :no_content
  end

  private

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      {name: params[:quiz][:name]}
    end

    def questions_arr
      params[:quiz][:questions]
    end

    def question_params myParam
      # myParam.permit(:name, :right_answer)
      {name: myParam[:name], right_answer: myParam[:right_answer]}
    end

    def choices_arr myParam
      myParam[:choices]
    end

    def choice_params myParam
      # myParam.permit(:text)
      {text: myParam[:text]}
      # myParam.require(:choice).permit(:text)
    end
end
