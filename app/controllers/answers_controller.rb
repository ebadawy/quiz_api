class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.where(url_params)

    render json: @answers
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    render json: @answer
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer

    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      head :no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy

    head :no_content
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      { answer: params[:answer],
        correct: params[:answer] == (Question.find(params[:question_id]).right_answer)}.merge url_params
    end

    def url_params
      h = {user_id: params[:user_id],
      quiz_id: params[:quiz_id]}
      if  params[:question_id]
        h.merge question_id: params[:question_id]
      end
    end
end
