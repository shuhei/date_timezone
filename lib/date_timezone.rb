module DateTimezone
  extend ActiveSupport::Concern

  included do
    columns_hash.each do |name, col|
      next unless col.type == :date
      define_method("#{name}=") do |value|
        time = value.is_a?(String) ? Time.zone.parse(value) : value
        self[name] = time
      end
    end
  end
end
