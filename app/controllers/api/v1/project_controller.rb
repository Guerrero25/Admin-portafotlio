class Api::V1::ProjectController < Api::V1::BaseController
    before_action except: [:index] do
        authenticate_permission(2, @current_level)
    end

    def index
        @projects = @current_user.projects.all
    end

    def create
        @project = @current_user.projects.create(project_params)
        render 'show'
    end

    def update
        @project = @current_user.projects.find(params[:id]).update_attributes(project_params)
        render 'show'
    end

    def destroy
        @project = @current_user.projects.destroy(params[:id])
        render 'show'
    end

    private

    def project_params
        params.permit(:name, :repository, :cover)
    end
end