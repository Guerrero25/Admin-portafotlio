class Api::V1::ProjectController < Api::V1::BaseController
    before_action do
        authenticate_permission(2, @current_level)
    end

    def index
        response = @current_user.projects.all
        render json: { response: response }
    end

    def create
        response = @current_user.projects.create(project_params)
        render json: { response: response }
    end

    def update
        @current_user.update_attributes(project_params)
        render json: { response: @current_user }
    end

    def destroy
        response = @current_user.projects.destroy(params[:id])
        render json: { response: response }
    end

    private

    def project_params
        params.require(:project).permit(:name, :repository, :cover)
    end
end