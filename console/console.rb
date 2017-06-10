require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/Screening.rb")
require_relative("../models/ticket.rb")

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer_1 = Customer.new({
    "name" => "Tommy Atkins",
    "money" => 100
})

customer_2 = Customer.new({
    "name" => "Da kine",
    "money" => 110
})

customer_3 = Customer.new({
    "name" => "Jane Doe",
    "money" => 120
})

customer_4 = Customer.new({
    "name" => "Benjaman Kyle",
    "money" => 130
})

customer_5 = Customer.new({
    "name" => "Rudolf Lingens",
    "money" => 140
})

customer_6 = Customer.new({
    "name" => "Joe Diner",
    "money" => 150
})

customer_7 = Customer.new({
    "name" => "Hong Gildong",
    "money" => 160
})

customer_8 = Customer.new({
    "name" => "Joe Shmoe",
    "money" => 170
})

film_1 = Film.new({
  "title" => "Wonder Woman",
  "cost" => 10
})

film_2 = Film.new({
  "title" => "LOTR: The Fellowship of the Ring",
  "cost" => 4
})

film_3 = Film.new({
  "title" => "Your Name",
  "cost" => 5
})

film_4 = Film.new({
  "title" => "Boy and the Beast",
  "cost" => 7
})

screening_1 = Screening.new({
  "show_time" => "09:00",
  "total_tickets" => 3,
  "film_id" => film_1.id
})

screening_1.set_show_time("15:00")
puts screening_1.show_time
screening_1.set_show_time("1059")
puts screening_1.show_time
puts screening_1.show_time
screening_1.set_show_time("bacon")
puts screening_1.show_time

# binding.pry
# nil
