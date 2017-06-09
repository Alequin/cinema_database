require_relative("../db/sql_runner.rb")

class Crud

  attr_reader :id

  protected

  def initialize(options, table_name)
    @id = options["id"] if options["id"]
    @table_name = table_name
  end

  def Crud.get_all(table_name)
    sql_command = "SELECT * FROM #{table_name}"
    results = SqlRunner.run(sql_command)
  end

  def Crud.delete_all(table_name)
    sql_command = "DELETE FROM #{table_name}"
    SqlRunner.run(sql_command)
  end

  def save(columns, values)
    columns_string = build_column_string(columns)
    sql_command = "INSERT INTO #{@table_name}
      (#{columns_string}) VALUES ($1, $2) RETURNING id"
    @id = SqlRunner.run(sql_command, values)[0]["id"]
  end

  def update(columns, values)
    columns_string = build_column_string(columns)
    sql_command = "UPDATE customers SET
      (#{columns_string}) = ($1, $2)
      WHERE id = #{@id}"
    SqlRunner.run(sql_command, values)
  end

  def delete()
    sql_command = "DELETE FROM #{@table_name} WHERE id = #{@id}"
    SqlRunner.run(sql_command)
  end

  private

  def build_column_string(columns)
    result = ""
    columns.each() do |column|
      result += "#{column}, "
    end
    return result[0..-3]
  end

end
