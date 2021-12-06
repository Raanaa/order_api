module Api
   module V1
     class UsersController < ApplicationController
      before_action :authenticate_request! , only: [:user_order]

        def create
         user = User.create(user_params)
          if user.save
           render json: UserRepresenter.new(user).as_json, status: :created
         else
           render json: { error: user.errors.full_messages.first }, status: :unprocessable_entity
         end
       end

       def user_order
        @orders = current_user!.orders
        render json: OrdersRepresenter.new(@orders).as_json
       end

        private
        def user_params
         params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :phone_number, :password)
       end
     end
   end
end