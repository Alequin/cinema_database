require_relative("../db/sql_runner.rb")

class Crud

  attr_reader :id

  def initialize(options)
    @id = options["id"] if options["id"]
  end



end
