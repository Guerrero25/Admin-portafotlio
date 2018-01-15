class AuthorizePermissionLevel
    prepend SimpleCommand

    def initialize(auth_level, current_level)
        @auth_level = auth_level
        @current_level = current_level
    end

    def call
        validation
    end

    private

    attr_reader :auth_level, :current_level

    def validation
        @val = auth_level == current_level
    end
end
