require("pg")
require("pry")

module SqlRunner

  def SqlRunner.run(sql_command, values)
    begin
      db = PG.connect({dbname: "cinema", host: "localhost"})
      db.prepare("query", sql_command)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end

end
