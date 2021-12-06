class OrdersRepresenter
    def initialize(orders)
      @orders = orders
    end

    def as_json
        orders.map do |order|
        {
          id: order.id,
          total_price: order.total_price,
          status: order.status
        }
      end
    end

    private

    attr_reader :orders
   end