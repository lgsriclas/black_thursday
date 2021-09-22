class Customer


  attr_reader   :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  def initialize(data)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = Time.parse(data[:created_at])
    @updated_at = Time.parse(data[:updated_at])
  end

  def update_fname(first_name)
    @first_name = first_name
  end

  def update_lname(last_name)
    @last_name = last_name
  end

  def update_updated_at
    @updated_at = Time.now
  end
end
