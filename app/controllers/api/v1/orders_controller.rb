module Api
    module V1
        class OrdersController < ApplicationController
            before_action :authenticate_request!
            before_action :set_order , only: [:show, :update, :destroy]

            # GET /orders
            def index
                @orders = Order.all
                render json: OrdersRepresenter.new(@orders).as_json
            end

            # POST /order
            def create
                @order = current_user!.orders.create(order_params)
                if @order.save
                    render json: OrderRepresenter.new(@order).as_json, status: :created
                else
                    render json: @order.errors, status: :unprocessable_entity
                end
            end

            # SHOW /orders/:id
            def show
                json_response(@order)
            end
    
            # PUT /orders/:id
            def update
                @order.update(order_params)
                json_response(@order)
            end

            def accept_or_reject_order
                @order = Order.find(params[:order_id])
                if @order.update(status: params[:status])
                    json_response(@order)
                else
                    render json: " #{params[:status]} is not a valid status"
                end
            end

            # DELETE /orders/:id
            def destroy
                @order.destroy
                render json: " Order with id = #{@order.id} is destroyed"
            end

            private

            def order_params
                params.permit(:total_price )
            end

            def set_order
                @order = Order.find(params[:id])
            end
        end
    end 
end