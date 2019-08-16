require_relative('../db/sql_runner')

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(details)
    @customer_id = details['customer_id']
    @film_id = details['film_id']
    @id = details['id'].to_i if details['id']
  end

end
