require_relative("../db/sql_runner.rb")

class Film

  attr_reader :id, :title
  attr_accessor :cost

  def initialize(options)
    @id = options["id"] if options["id"]
    @title = options["title"]
    @cost = options["cost"]
  end

end
