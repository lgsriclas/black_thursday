class Merchant
  attr_reader     :id,
                  :created_at,
                  :name

  def initialize(data)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def update_name(name)
    @name = name
  end

  def update_updated_at
    @updated_at = Time.now
  end
end
