require_relative("crud.rb")
require_relative("ticket.rb")

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

  def get_tickets()
    sql_command = "SELECT tickets.* FROM tickets
      WHERE customer_id = #{@id}"
    tickets = SqlRunner.run(sql_command)
    return Ticket.map_sql_result(tickets)
  end

  def get_number_of_tickets()
    sql_command = "SELECT COUNT(tickets.*) FROM tickets
      WHERE customer_id = #{@id}"
    tickets_count = SqlRunner.run(sql_command)[0]["count"]
    return tickets_count
  end

  def get_screenings()
    sql_command = "SELECT screenings.* FROM customers
      INNER JOIN tickets
      ON customers.id = tickets.customer_id
      INNER JOIN screenings
      ON tickets.screening_id = screenings.id
      WHERE customers.id = #{@id}"
    screenings = SqlRunner.run(sql_command)
    return Screening.map_sql_result(screenings)
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
