class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @profile = current_user.profile || current_user.create_profile
    end

    def edit
    end
end
