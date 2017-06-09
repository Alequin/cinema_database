require_relative("../db/sql_runner.rb")

class Customer

  attr_reader :id, :money
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @money = options["money"]
  end

  def Customer.get_all()

  end

  def Customer.delete_all()
    sql_command = "DELETE FROM customers"
    SqlRunner.run(sql_command)
  end

  def save()
    sql_command = "INSERT INTO customers
      (name, money) VALUES ($1, $2)"
    values = [@name, @money]
    SqlRunner.run(sql_command, values)
  end

  def find(id)

  end

  def update()

  end

  def delete()

  end



end
