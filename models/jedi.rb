require( 'pg' )
require_relative('../db/sql_runner')

class Jedi

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO Jedis (name) VALUES ('#{ @name }')"
    SqlRunner.run_sql( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM Jedis WHERE id = #{id}"
    jedis = SqlRunner.run_sql(sql)
    return Jedi.new(jedis.first)
  end




  def self.all()
    sql = "SELECT * FROM Jedis"
    jedis = SqlRunner.run_sql(sql)
    result = jedis.map { |j| Jedi.new( j ) }
    return result
  end

end