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

  def Screening.most_popular_screening()
    screening_id = Screening.group_tickets_by_screening_sql_result("DESC")[0]["screening_id"]
    return Screening.find(screening_id)
  end

  def Screening.least_popular_screening()
    screening_id = Screening.group_tickets_by_screening_sql_result("ASC")[0]["screening_id"]
    return Screening.find(screening_id)
  end

  def Screening.group_tickets_by_screening_sql_result(order)
    sql_command = "SELECT screening_id, COUNT(screening_id)
      FROM tickets GROUP BY screening_id ORDER BY count #{order}"
    return SqlRunner.run(sql_command)
  end
  private_class_method :group_tickets_by_screening_sql_result

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

  def get_film()
    sql_command = "SELECT films.* FROM films
      WHERE films.id = #{@film_id}"
    film = SqlRunner.run(sql_command)[0]
    return Film.new(film)
  end

  def get_tickets()
    tickets = get_tickets_sql_result()
    return Ticket.map_sql_result(tickets)
  end

  def tickets_sold_count()
    return get_tickets_sql_result().ntuples
  end

  def tickets_available?()
    return tickets_sold_count() < @total_tickets
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

  private

  def get_tickets_sql_result()
    sql_command = "SELECT tickets.* FROM tickets
      WHERE tickets.screening_id = #{@id}"
    return SqlRunner.run(sql_command)
  end

end
