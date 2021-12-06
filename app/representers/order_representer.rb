class OrderRepresenter
    def initialize(order)
      @order = order
    end

    def as_json
      {
        id: order.id,
        total_price: order.total_price,
        status: order.status
      }
    end

    private

    attr_reader :order
   end