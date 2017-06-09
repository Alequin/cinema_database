class Customers

  attr_reader :id, :money
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @money = options["money"]
  end

end
