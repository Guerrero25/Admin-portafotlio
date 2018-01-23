class Api::V1::UserController < Api::V1::BaseController
    before_action only: [:generate_token] do
        authenticate_permission(2, @current_level)
    end

    def generate_token
        command = GeneratorToken.call(@current_user)

        if command.success?
            render json: { public_token: command.result }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end