require_relative('../db/sql_runner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @name = details['name']
    @funds = details['funds']
    @id = details['id'].to_i if details['id']
  end

end 
