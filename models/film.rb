require_relative("crud.rb")

class Film < Crud

  attr_reader :title
  attr_accessor :cost

  @@table_name = "films"

  def initialize(options)
    super(options["id"], @@table_name)
    @title = options["title"]
    @cost = options["cost"].to_i
  end

  def Film.map_sql_result(result)
    return result.map(){|item| Film.new(item)}
  end

  def Film.get_all()
    films = Crud.get_all(@@table_name)
    return films.map(){|film| Film.new(film)}
  end

  def Film.delete_all()
    Crud.delete_all(@@table_name)
  end

  def Film.find(id)
    film = Crud.find(id, @@table_name)
    return Film.new(film)
  end

  def save()
    columns = ["title", "cost"]
    values = [@title, @cost]
    super(columns, values)
  end

  def update()
    columns = ["title", "cost"]
    values = [@title, @cost]
    super(columns, values)
  end

  def get_screenings()
    sql_command = "SELECT screenings.* FROM screenings
      WHERE film_id = #{@id}"
    screenings = SqlRunner.run(sql_command)
    return Screening.map_sql_result(screenings)
  end

  def get_tickets()
    tickets = get_tickets_sql_result()
    return Ticket.map_sql_result(tickets)
  end

  def tickets_sold_count()
    return get_tickets_sql_result().ntuples
  end

  def get_booked_customers()
    customers = get_booked_customers_sql_result()
    return Customer.map_sql_result(customers)
  end

  def get_booked_customers_count()
    return get_booked_customers_sql_result().ntuples
  end

  private

  def get_booked_customers_sql_result()
    sql_command = "SELECT customers.* FROM films
      INNER JOIN screenings
      ON films.id = screenings.film_id
      INNER JOIN tickets
      ON screenings.id = tickets.screening_id
      INNER JOIN customers
      ON tickets.customer_id = customers.id
      WHERE films.id = #{@id}"
    return SqlRunner.run(sql_command)
  end

  def get_tickets_sql_result()
    sql_command = "SELECT tickets.* FROM films
      INNER JOIN screenings
      ON films.id = screenings.film_id
      INNER JOIN tickets
      ON screenings.id = tickets.screening_id
      WHERE films.id = #{@id}
      ORDER BY tickets.screening_id"
    return SqlRunner.run(sql_command)
  end
end
