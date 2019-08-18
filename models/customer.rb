require_relative('../db/sql_runner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @name = details['name']
    @funds = details['funds']
    @id = details['id'].to_i if details['id']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) VALUES ($1, @2) WHERE id = S3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Customer.map_items(film_data)
  end

  def self.map_items(data)
     result = data.map{|customer| Customer.new(customer)}
     return result
   end

end
