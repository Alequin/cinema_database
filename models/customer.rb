require_relative("../db/sql_runner.rb")
require_relative("crud.rb")

class Customer < Crud

  attr_reader :money
  attr_accessor :name

  def initialize(options)
    super(options)
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
    sql_command = "INSERT INTO customers
      (name, money) VALUES ($1, $2) RETURNING id"
    @id = run_sql_with_name_and_money(sql_command)[0]["id"]
  end

  def update()
    sql_command = "UPDATE customers SET
      (name, money) = ($1, $2)
      WHERE id = #{@id}"
    run_sql_with_name_and_money(sql_command)
  end

  def delete()
    sql_command = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql_command)
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

  private

  def run_sql_with_name_and_money(sql_command)
    values = [@name, @money]
    return SqlRunner.run(sql_command, values)
  end

end
