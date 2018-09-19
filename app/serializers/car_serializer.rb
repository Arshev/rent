class CarSerializer < ActiveModel::Serializer
  attributes :id, :car_name, :year, :color, :transmission, :is_air, :engine_capacity, :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_5, :old_price_1, :old_price_2, :old_price_3, :old_price_4, :old_price_5, :price_hour, :price_main, :deposit, :description, :fuel, :number_doors, :active, :sort, :show_on_main
end
