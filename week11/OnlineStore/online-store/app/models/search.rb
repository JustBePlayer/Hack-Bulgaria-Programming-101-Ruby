class Search
  class << self


    def by_type_and_property(type, property = :name, slug)
      #puts product_params[:property]
      case type
      when "products"
        Product.where("#{property} LIKE ?", "%#{slug}%")
      when "brands"
        Brand.where("#{property} LIKE ?", "%#{slug}%")
      when "categories"
        Category.where("#{property} LIKE ?", "%#{slug}%")
      end
    end

  end
end
