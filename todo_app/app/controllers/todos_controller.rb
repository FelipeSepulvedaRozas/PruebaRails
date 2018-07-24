class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new 
	end

	def create
		@todo = Todo.new(todo_params)
		@todo.save
		@todo.update_attributes(:completed=>false)
		redirect_to todos_path	
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def edit
		@todo = Todo.find(params[:id])	
	end

	def update
		@todo = Todo.find(params[:id])
		@todo.update(todo_params)
		redirect_to todos_path
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to todos_path	
	end

	def completed
		@todo = Todo.find(params[:id])
		@todo.update_attributes(:completed=>true)
		redirect_to todos_path
	end

	def list
		@todos = Todo.all
	end

	private 
		def todo_params
			params.require(:todo).permit(:description, :completed)
		end

end
