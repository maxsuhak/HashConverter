module HashConverter
  class << self
    def to_underscore hash
      convert hash, :underscore
    end

    def to_camel_case hash
      convert hash, :camelize
    end

    def convert obj, *method
      case obj
      when Hash
        obj.stringify_keys.inject({}) do |hash, (key, value)|
          value = convert value, *method
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

