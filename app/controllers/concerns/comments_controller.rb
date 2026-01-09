class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_board
    before_action :set_task

    def new
        @comment = @task.comments.build(user: current_user)
    end

    def create
        @comment = @task.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to board_task_path(@board, @task), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new, status: :unprocessable_entity
        end
    end

    private
    def set_board
        @board = current_user.boards.find(params[:board_id])
    end

    def set_task
        @task = @board.tasks.find(params[:task_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
