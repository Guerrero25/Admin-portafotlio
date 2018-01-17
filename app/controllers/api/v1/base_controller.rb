class Api::V1::BaseController < ApplicationController
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
        auth = AuthorizeApiRequest.call(request.headers).result
        @current_user = auth[:user]
        @current_level = auth[:permission_level]
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user && @current_level
    end

    def authenticate_permission(auth_level,current_level)
        permitted = AuthorizePermissionLevel.call(auth_level,current_level).result
        render json: { error: 'Not Authorized' }, status: 401 unless permitted
    end
end