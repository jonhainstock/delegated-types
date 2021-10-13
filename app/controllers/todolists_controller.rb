class TodolistsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @todolists = Recording.todolists
  end

  def show
    @todolst
  end

  def new
    @todolist = Todolist.new
  end

  def create
    begin
      Recording.record new_todo_list
      redirect_to todolists_path, notice: 'Todolist created.'
    rescue ActiveRecord::RecordInvalid => invalid
      @todolist = invalid.record.recordable
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  end

  def update 
  end

  private 
    def new_todo_list
      Todolist.new(params.require(:todolist).permit(:name, :description))
    end
end
