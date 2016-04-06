module HashConverter
  class << self

    # convert keys to snake_case
    def to_underscore hash
      convert keys_to_string(hash), :underscore
    end

    # convert keys to camel_case
    def to_camel_case hash
      convert keys_to_string(hash), :camelize
    end

    # convert keys to string
    def keys_to_string hash
      convert hash, :to_s
    end

    # convert keys to symbol
    def keys_to_symbol hash
      convert hash, :to_sym
    end

    # convert hash values to float if BigDecimal
    def to_float obj
      case obj
      when Hash
        obj.inject({}) do |hash, (key, value)|
          value = value.to_f if value.kind_of? BigDecimal
          hash[key] = value
          hash
        end
      when Array
        obj.map { |mass| to_float mass }
      else
        obj
      end
    end

    # converting
    def convert obj, *method
      case obj
      when Hash
        obj.inject({}) do |hash, (key, value)|
          hash[key.send(*method)] = value
          hash
        end
      when Array
        obj.map {|mass| convert mass, *method }
      else
        obj
      end
    end
  end
end
