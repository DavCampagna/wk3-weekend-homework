require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Davide',
  'funds' => 20
  })

customer1.save()

film1 = Film.new({
  'title' => 'Neverland',
  'price' => 6
  })

film1.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save








binding.pry
nil
