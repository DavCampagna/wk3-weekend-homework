require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

customer1 = Customer.new({
  'name' => 'Davide',
  'funds' => 20
  })
  
customer1.save()















binding.pry
nil
