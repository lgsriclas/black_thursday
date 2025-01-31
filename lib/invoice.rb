class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :created_at,
              :status,
              :updated_at

  def initialize(data)
    @id          = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status].to_sym
    @created_at  = Time.parse(data[:created_at])
    @updated_at  = Time.parse(data[:updated_at])
  end

  def update_status(status)
    @status = status
  end

  def update_updated_at
    @updated_at = Time.now
  end
end
