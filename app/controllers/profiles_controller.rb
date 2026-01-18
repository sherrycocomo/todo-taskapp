class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile, only: [:edit, :update]

    def show
        @profile = current_user.profile || current_user.create_profile
    end

    def edit
    end

    def update
        @profile.assign_attributes(profile_params)
        if @profile.update(profile_params)
            redirect_to profile_path, notice: 'プロフィール更新！'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :gender,
            :birthday,
            :subscribed,
            :avatar
        )
    end

    def set_profile
        @profile = current_user.prepare_profile
    end
end
