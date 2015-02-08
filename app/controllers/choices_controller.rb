class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :update, :destroy]

  # GET /choices
  # GET /choices.json
  def index
    if params[:quiz_id] and params[:question_id]
      @choices = Quiz.find(params[:quiz_id]).questions.
                  find(params[:question_id]).choices
    else
      @choices = Choice.all
    end
    render json: @choices
  end

  # GET /choices/1
  # GET /choices/1.json
  def show
    render json: @choice
  end

  # POST /choices
  # POST /choices.json
  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      render json: @choice, status: :created, location: @choice
    else
      render json: @choice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /choices/1
  # PATCH/PUT /choices/1.json
  def update
    @choice = Choice.find(params[:id])

    if @choice.update(choice_params)
      head :no_content
    else
      render json: @choice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    @choice.destroy

    head :no_content
  end

  private

    def set_choice
      @choice = Choice.find(params[:id])
    end

    def choice_params
      params.require(:choice).permit(:text)
    end
end
