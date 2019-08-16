require_relative('../db/sql_runner')

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(details)
    @title = details['title']
    @price = details['price']
    @id = details['id'].to_i if details['id']
  end

end
