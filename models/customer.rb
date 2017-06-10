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

  def Customer.map_sql_result(result)
    return result.map(){|item| Customer.new(item)}
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
    to_save = {
      "name" => @name,
      "money" => @money
    }
    super(to_save)
  end

  def update()
    to_update = {
      "name" => @name,
      "money" => @money
    }
    super(to_update)
  end

  def get_tickets()
    tickets = get_tickets_sql_result
    return Ticket.map_sql_result(tickets)
  end

  def get_number_of_tickets()
    return get_tickets_sql_result().ntuples
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

  private

  def get_tickets_sql_result()
    sql_command = "SELECT tickets.* FROM tickets
      WHERE customer_id = #{@id}"
    return SqlRunner.run(sql_command)
  end

end
