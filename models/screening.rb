require_relative("crud.rb")

class Screening < Crud

  attr_reader :title
  attr_accessor :show_time

  @@table_name = "screenings"

  def initialize(options)
    super(options["id"], @@table_name)
    @show_time = options["show_time"]
    @total_tickets = options["total_tickets"].to_i
    @film_id = options["film_id"].to_i
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

end
