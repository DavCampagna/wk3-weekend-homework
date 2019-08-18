require_relative('../db/sql_runner')

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(details)
    @title = details['title']
    @price = details['price']
    @id = details['id'].to_i if details['id']
  end

  def save
    sql = "INSERT INTO films(title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) VALUES ($1, @2) WHERE id = S3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM films WHERE id = S1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Film.map_items(customer_data)
  end

  def self.map_items(data)
     result = data.map{|film| Film.new(film)}
     return result
   end

end
