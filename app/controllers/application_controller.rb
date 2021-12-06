class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
 
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
    def authenticate_request!
      return invalid_authentication if !payload || !AuthenticationTokenService.valid_payload(payload.first)
      current_user!
      invalid_authentication unless @current_user
    end
    def current_user!
      @current_user = User.find_by(id: payload[0]['user_id'])
    end
    
    private
    def payload
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      AuthenticationTokenService.decode(token)
    rescue StandardError
      nil
    end
    def invalid_authentication
      render json: { error: 'You will need to login first' }, status: :unauthorized
    end
    def user_not_authorized(exception)
     policy_name = exception.policy.class.to_s.underscore.remove "_policy"
     exception_query = exception.query.delete "?"
     render json: { error: "you are not allowed to #{exception_query} a #{policy_name}." }
   end
end