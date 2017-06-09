require_relative("crud.rb")

class Customer < Crud

  attr_reader :money
  attr_accessor :name

  @@table_name = "customers"

  def initialize(options)
    super(options["id"], @@table_name)
    @name = options["name"]
    @money = options["money"].to_i
  end

  def Customer.get_all()
    customers = Crud.get_all(@@table_name)
    return customers.map() {|customer| Customer.new(customer)}
  end

  def Customer.delete_all()
    Crud.delete_all(@@table_name)
  end

  def Customer.find(id)
    customer = Crud.find(id, @@table_name)
    return Customer.new(customer)
  end

  def save()
    columns = ["name", "money"]
    values = [@name, @money]
    super(columns, values)
  end

  def update()
    columns = ["name", "money"]
    values = [@name, @money]
    super(columns, values)
  end

  def increase_money_by(amount)
    @money += amount
  end

  def decrease_money_by(amount)
    @money -= amount
  end

  def enough_money?(cost_of_item)
    return @money >= cost_of_item
  end

end
