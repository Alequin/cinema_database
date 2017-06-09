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

  end

  def Screening.delete_all()

  end

  def Screening.find(id)

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
