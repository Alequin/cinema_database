require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/Screening.rb")
require_relative("../models/ticket.rb")

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customers = []

customers[0] = Customer.new({
    "name" => "Tommy Atkins",
    "money" => 100
})

customers[1] = Customer.new({
    "name" => "Da kine",
    "money" => 110
})

customers[2] = Customer.new({
    "name" => "Jane Doe",
    "money" => 120
})

customers[3] = Customer.new({
    "name" => "Benjaman Kyle",
    "money" => 130
})

customers[4] = Customer.new({
    "name" => "Rudolf Lingens",
    "money" => 140
})

customers[5] = Customer.new({
    "name" => "Joe Diner",
    "money" => 150
})

customers[6] = Customer.new({
    "name" => "Hong Gildong",
    "money" => 160
})

customers[7] = Customer.new({
    "name" => "Joe Shmoe",
    "money" => 170
})

customers.each() do |customer|
  customer.save()
end

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

screening_2 = Screening.new({
  "show_time" => "10:30",
  "total_tickets" => 3,
  "film_id" => film_2.id
})

screening_3 = Screening.new({
  "show_time" => "12:00",
  "total_tickets" => 3,
  "film_id" => film_3.id
})

screening_4 = Screening.new({
  "show_time" => "14:30",
  "total_tickets" => 3,
  "film_id" => film_4.id
})

screening_5 = Screening.new({
  "show_time" => "16:00",
  "total_tickets" => 3,
  "film_id" => film_1.id
})

screening_6 = Screening.new({
  "show_time" => "17:30",
  "total_tickets" => 3,
  "film_id" => film_2.id
})

screening_7 = Screening.new({
  "show_time" => "19:00",
  "total_tickets" => 3,
  "film_id" => film_3.id
})

screening_8 = Screening.new({
  "show_time" => "20:30",
  "total_tickets" => 3,
  "film_id" => film_4.id
})

ticket_1 = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screening_1.id
})

ticket_2 = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screening_3.id
})

ticket_3 = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screening_6.id
})

ticket_4 = Ticket.new({
  "customer_id" => customers[1].id,
  "screening_id" => screening_8.id
})

ticket_5 = Ticket.new({
  "customer_id" => customers[2].id,
  "screening_id" => screening_2.id
})

ticket_6 = Ticket.new({
  "customer_id" => customers[2].id,
  "screening_id" => screening_7.id
})

ticket_6 = Ticket.new({
  "customer_id" => customers[3].id,
  "screening_id" => screening_6.id
})

ticket_6 = Ticket.new({
  "customer_id" => customers[4].id,
  "screening_id" => screening_3.id
})

ticket_7 = Ticket.new({
  "customer_id" => customers[4].id,
  "screening_id" => screening_2.id
})

ticket_8 = Ticket.new({
  "customer_id" => customers[5].id,
  "screening_id" => screening_5.id
})

ticket_9 = Ticket.new({
  "customer_id" => customers[5].id,
  "screening_id" => screening_1.id
})

ticket_10 = Ticket.new({
  "customer_id" => customers[6].id,
  "screening_id" => screening_1.id
})

ticket_11 = Ticket.new({
  "customer_id" => customers[7].id,
  "screening_id" => screening_8.id
})

puts ticket_1.customer_id
ticket_1.change_customer(customers[7])
puts ticket_1.customer_id

# binding.pry
# nil
