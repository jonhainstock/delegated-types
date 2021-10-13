class TodosController < ApplicationController
	before_action :authenticate_user!

	def index
		@recording = Recording.find(params[:recording_id])
		@todo = Todo.new
	end

	def create
		begin
			@recording = Recording.find(params[:recording_id])
			Recording.record(Todo.new(params.require(:todo).permit(:content)), parent: @recording)
			redirect_to recording_todos_path(@recording), notice: 'Todo created.'
		rescue ActiveRecord::RecordInvalid => invalid
			@todo = invalid.record.recordable
			render :index, status: :unprocessable_entity
		end
	end
end
