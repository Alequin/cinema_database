class Customers

  attr_reader :id, :money
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @money = options["money"]
  end

  def Customer.get_all()

  end

  def Customer.delete_all()

  end

  def save()

  end

  def find(id)

  end

  def update()

  end

  def delete()

  end



end
