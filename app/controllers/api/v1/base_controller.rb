class Api::V1::BaseController < ApplicationController
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result[:user]
        @current_level = AuthorizeApiRequest.call(request.headers).result[:permission_level]
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def authenticate_permission(auth_level,current_level)
        permitted = AuthorizePermissionLevel.call(auth_level,current_level).result
        render json: { error: 'Not Authorized' }, status: 401 unless permitted
    end
end