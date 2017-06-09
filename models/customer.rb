require_relative("../db/sql_runner.rb")
require_relative("crud.rb")

class Customer < Crud

  attr_reader :money
  attr_accessor :name

  def initialize(options)
    table_name = "customers"
    super(options, table_name)
    @name = options["name"]
    @money = options["money"]
  end

  def Customer.get_all()
    sql_command = "SELECT * FROM customers"
    customers = SqlRunner.run(sql_command)
    return customers.map() {|customer| Customer.new(customer)}
  end

  def Customer.delete_all()
    sql_command = "DELETE FROM customers"
    SqlRunner.run(sql_command)
  end

  def Customer.find(id)
    sql_command = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customers_details = SqlRunner.run(sql_command, values)[0]
    return Customer.new(customers_details)
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
