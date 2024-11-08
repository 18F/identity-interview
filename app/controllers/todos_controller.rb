class TodosController < ApplicationController
  def index
    @order_by = case params[:order]
                when 'created_at'
                  'created_at'
                else
                  'due_at'
                end

    @todos = Todo.all.order(@order_by => :desc).to_a
  end

  def create
    if params[:random].to_s == 'true'
      Todo.create_random(
        count: params[:count].to_i,
      )
    end

    redirect_to todos_path
  end
end
