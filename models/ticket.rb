require_relative("crud.rb")

class Ticket < Crud

  attr_reader :screening_id, :customer_id

  @@table_name = "tickets"

  def initialize(options)
    super(options["id"], @@table_name)
    @customer_id = options["customer_id"].to_i
    @screening_id = options["screening_id"].to_i
  end

  def Ticket.map_sql_result(result)
    return result.map(){|item| Ticket.new(item)}
  end

  def Ticket.get_all()
    tickets = Crud.get_all(@@table_name)
    return tickets.map() {|ticket| Ticket.new(ticket)}
  end

  def Ticket.delete_all()
    Crud.delete_all(@@table_name)
  end

  def Ticket.find(id)
    ticket = Crud.find(id, @@table_name)
    return Ticket.new(ticket)
  end

  def save()
    columns = ["customer_id", "screening_id"]
    values = [@customer_id, @screening_id]
    super(columns, values)
  end

  def update()
    columns = ["customer_id", "screening_id"]
    values = [@customer_id, @screening_id]
    super(columns, values)
  end

  def change_customer(customer)
    @customer_id = customer.id
  end

  def get_customer()
    sql_command = "SELECT customers.* FROM customers
      WHERE customers.id = #{@customer_id}"
    customer = SqlRunner.run(sql_command)[0]
    return Customer.new(customer)
  end

  def get_screening()
    sql_command = "SELECT screenings.* FROM screenings
      WHERE screenings.id = #{@screening_id}"
    screening = SqlRunner.run(sql_command)[0]
    return Screening.new(screening)
  end

  def get_film()
    sql_command = "SELECT films.* FROM tickets
      INNER JOIN screenings
      ON tickets.screening_id = screenings.id
      INNER JOIN films
      ON screenings.film_id = films.id
      WHERE tickets.id = #{@id}"
    film = SqlRunner.run(sql_command)[0]
    return Film.new(film)
  end

end
