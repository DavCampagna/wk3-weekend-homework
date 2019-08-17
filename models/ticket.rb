require_relative('../db/sql_runner')

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(details)
    @customer_id = details['customer_id']
    @film_id = details['film_id']
    @id = details['id'].to_i if details['id']
  end

  def save
    sql = "INSERT INTO tickets(customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)[0]
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) VALUES ($1, @2) WHERE id = S3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM tickets WHERE id = S1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end


end
