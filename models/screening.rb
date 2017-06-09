require_relative("crud.rb")

class Screening < Crud

  attr_reader :title
  attr_accessor :cost

  def initialize(options)
    @@table_name = "screenings"
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

  end

  def update()

  end

end
