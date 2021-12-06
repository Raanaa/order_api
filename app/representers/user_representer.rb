class UserRepresenter
    def initialize(user)
      @user = user
    end
    
    def as_json
      {
        id: user.id,
        first_name: user.first_name,
        middle_name: user.middle_name,
        last_name: user.last_name,
        email: user.email,
        phone_number: user.phone_number,
        token: AuthenticationTokenService.call(user.id)
      }
    end
    private
      attr_reader :user
end