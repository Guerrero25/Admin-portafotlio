class AuthorizeApiRequest
    prepend SimpleCommand

    def initialize(headers = {})
        @headers = headers
    end

    def call
        user
    end

    private

    attr_reader :headers

    def user
        if decoded_auth_token
            decode_token = decoded_auth_token

            @user ||= User.find(decode_token[:user_id])
            @permission_level = decode_token[:permission_level]
            if @user == nil || @permission_level == nil
                errors.add(:token, 'Invalid token')
            else
                current = { user: @user, permission_level: @permission_level }
            end
        end
    end

    def decoded_auth_token
        @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
        if headers['Authorization'].present?
            return headers['Authorization'].split(' ').last
        else
            errors.add(:token, 'Missing token')
        end
        
        nil
    end
end