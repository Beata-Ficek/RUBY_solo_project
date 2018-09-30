require('pg')
require('uri')


class SqlRunner

  def self.run(sql, values = [])
    begin
      uri = URI.parse(ENV['DATABASE_URL'])

      db = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)

      db.prepare("query", sql)

      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
