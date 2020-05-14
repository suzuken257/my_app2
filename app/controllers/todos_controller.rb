class TodosController < ApplicationController
  def create
    @todo = Todo.create(todo_params)
    respond_to do |format|
      format.html { redirect_to user_path(params[:user_id]) }
      format.json
    end
  end

  def destroy
    todo=Todo.find(params[:id])
    if todo.destroy
      redirect_to "/users/#{current_user.id}", notice: '削除が完了しました'
    else
      flash.now[:alert] = '削除できませんでした'
      render :destroy
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:content).merge(user_id: current_user.id)
  end
end
