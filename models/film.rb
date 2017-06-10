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
    sql_command = "SELECT tickets.* FROM films
      INNER JOIN screenings
      ON films.id = screenings.film_id
      INNER JOIN tickets
      ON screenings.id = tickets.screening_id
      WHERE films.id = #{@id}
      ORDER BY tickets.screening_id"
    tickets = SqlRunner.run(sql_command)
    return Ticket.map_sql_result(tickets)
  end

  # Is this really needed as a similar method will be available is class
  # Screening and customers will be retrevable from ticket objects.
  # def get_customers()
  #   sql_command = "SELECT customers.* FROM films
  #     INNER JOIN screenings
  #     ON films.id = screenings.film_id
  #     INNER JOIN tickets
  #     ON screenings.id = tickets.screening_id
  #     INNER JOIN customers
  #     ON tickets.customer_id = customers.id
  #     WHERE films.id = #{@id}"
  #   customers = SqlRunner.run(sql_command)
  #   return Customer.map_sql_result(customers)
  # end
end
