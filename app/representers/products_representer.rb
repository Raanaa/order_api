class ProductsRepresenter
    def initialize(products)
      @products = products
    end

    def as_json
        products.map do |product|
        {
            id: product.id,
            name: product.name,
            price: product.price,
            quantity: product.quantity
        }
      end
    end

    private

    attr_reader :products
   end