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

end
