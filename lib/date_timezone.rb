module DateTimezone
  extend ActiveSupport::Concern

  included do
    columns_hash.each do |name, col|
      next unless col.type == :date
      define_method("#{name}=") do |value|
        self[name] = case value
                     when String then Time.zone.parse(value)
                     when Time then value.in_time_zone
                     else value
                     end
      end
    end
  end
end
