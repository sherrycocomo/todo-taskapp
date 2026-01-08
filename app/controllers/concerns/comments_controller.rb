class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_board
    before_action :set_task

    def new
        @comment = @task.comments.build(user: current_user)
    end

    private
    def set_board
        @board = current_user.boards.find(params[:board_id])
    end

    def set_task
        @task = @board.tasks.find(params[:task_id])
    end
end
