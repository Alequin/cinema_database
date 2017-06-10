require_relative("crud.rb")

class Screening < Crud

  attr_reader :title, :show_time

  @@table_name = "screenings"

  def initialize(options)
    super(options["id"], @@table_name)
    @show_time = set_show_time(options["show_time"])
    @total_tickets = options["total_tickets"].to_i
    @film_id = options["film_id"].to_i
  end

  def Screening.map_sql_result(result)
    return result.map(){|item| Screening.new(item)}
  end

  def Screening.get_all()
    screenings = Crud.get_all(@@table_name)
    return screenings.map() {|screening| Screening.new(screening)}
  end

  def Screening.delete_all()
    Crud.delete_all(@@table_name)
  end

  def Screening.find(id)
    screening = Crud.find(id, @@table_name)
    return Screening.new(screening)
  end

  def save()
    columns = ["film_id", "show_time", "total_tickets"]
    values = [@film_id, @show_time, @total_tickets]
    super(columns, values)
  end

  def update()
    columns = ["film_id", "show_time", "total_tickets"]
    values = [@film_id, @show_time, @total_tickets]
    super(columns, values)
  end

  def set_show_time(time_str)
    @show_time = time_str if(time_str.scan(/^\d\d:\d\d$/).length == 1)
  end

  def get_tickets()
    sql_command = "SELECT tickets.* FROM tickets
      WHERE tickets.screening_id = #{id}"
    tickets = SqlRunner.run(sql_command)
    return Ticket.map_sql_result(tickets)
  end

  def tickets_sold()
    sql_command = "SELECT COUNT(tickets.*) FROM tickets
      WHERE tickets.screening_id = #{id}"
    ticket_count = SqlRunner.run(sql_command)[0]["count"].to_i
    return ticket_count
  end

  def tickets_available?()
    return tickets_sold < @total_tickets
  end

  def get_customers()
    sql_command = "SELECT customers.* FROM screenings
      INNER JOIN tickets
      ON screenings.id = tickets.screening_id
      INNER JOIN customers
      ON tickets.customer_id = customers.id
      WHERE screenings.id = #{@id}"
    customers = SqlRunner.run(sql_command)
    return Customer.map_sql_result(customers)
  end

end
