class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_board
    before_action :set_task, only: [:edit, :update, :destroy]

    def new
        @task = @board.tasks.build
    end

    def create
        @task = @board.tasks.build(task_params)
        @task.user = current_user

        if @task.save
            redirect_to board_path(@board), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @task = Task.find(params[:id])
        @comments = @task.comments
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to board_task_path(@board, @task), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task.destroy!
        redirect_to board_path(@board), status: :see_other, notice: '削除に成功しました'
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end

    def set_task
        @task = @board.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :content, :deadline, :eyecatch)
    end
end
