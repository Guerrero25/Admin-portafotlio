class GeneratorToken
    prepend SimpleCommand

    def initialize(current_user)
        @current_user = current_user
    end

    def call
        generator
    end

    private

    attr_accessor :current_user

    def generator
        if current_user.public_token === ''
            token = JsonWebToken.encode({ user_id: current_user.id, permission_level: 1 }, 12.months.from_now)
            current_user.update(public_token: token)
            current_user.public_token if current_user.save
        else
            errors.add(:token, 'The Token Exits')
        end
    end
end