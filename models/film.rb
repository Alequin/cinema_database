require_relative("crud.rb")

class Film < Crud

  attr_reader :id, :title
  attr_accessor :cost

  def initialize(options)
    @@table_name = "films"
    super(options["id"], @@table_name)
    @title = options["title"]
    @cost = options["cost"]
  end

  def Film.get_all()

  end

  def Film.delete_all()

  end

  def Film.find(id)

  end

  def save()

  end

  def update()

  end

end
