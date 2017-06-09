require_relative("crud.rb")

class Ticket < Crud

  attr_reader :screening_id
  attr_accessor :customer_id

  @@table_name = "tickets"

  def initialize(options)
    super(options["id"], @@table_name)
    @customer_id = options["customer_id"].to_i
    @screening_id = options["screening_id"].to_i
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

end
