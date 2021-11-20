class TodoListsController < ApplicationController
  before_action :find_todo_list, only: [:show, :destroy, :update]

  def index
    todo_lists = TodoList.all.order(created_at: :desc)
    render json: {status: "SUCCESS", data: todo_lists}
  end

  def show
    render json: {status: "SUCCESS", data: @todo_list}
  end

  def create
    todo_list = TodoList.new(todo_list_params)
    if todo_list.save
      render json: {status: "SUCCESS", data: todo_list}
    else
      render json: {status: "ERROR", data: todo_list.errors}
    end
  end

  def destroy
    @todo_list.destroy
    render json: {status: "SUCCESS", data: @todo_list}
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: {status: "SUCCESS", data: @todo_list}
    else
      render json: {status: "ERROR", data: @todo_list.errors}
    end
  end

  private

    def find_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.permit(:todo)
    end
end
