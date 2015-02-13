class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index

    @groups = User.find(params[:user_id]).groups

    render json: @groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    render json: @group
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    if params[:user_id]
      @group.users << User.find(params[:user_id])
    end

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    if params[:action] == "add"
      @group.users << User.find(params[:user_id])
    elsif params[:action] == "delete"
      @group.users.destroy User.find(params[:user_id])
    end

    if @group.save
      head :no_content
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy

    head :no_content
  end


  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      {group_name: params[:group_name], students_number: params[:students_number]}
    end
end
