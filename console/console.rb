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
films = []
screenings = []
tickets = []

def call_save_on_all(array)
  array.each() do |item|
    item.save()
  end
end

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

call_save_on_all(customers)

films[0] = Film.new({
  "title" => "Wonder Woman",
  "cost" => 10
})

films[1] = Film.new({
  "title" => "LOTR: The Fellowship of the Ring",
  "cost" => 4
})

films[2] = Film.new({
  "title" => "Your Name",
  "cost" => 5
})

films[3] = Film.new({
  "title" => "Boy and the Beast",
  "cost" => 7
})

call_save_on_all(films)

screenings[0] = Screening.new({
  "show_time" => "09:00",
  "total_tickets" => 3,
  "film_id" => films[0].id
})

screenings[1] = Screening.new({
  "show_time" => "10:30",
  "total_tickets" => 3,
  "film_id" => films[1].id
})

screenings[2] = Screening.new({
  "show_time" => "12:00",
  "total_tickets" => 3,
  "film_id" => films[2].id
})

screenings[3] = Screening.new({
  "show_time" => "14:30",
  "total_tickets" => 3,
  "film_id" => films[3].id
})

screenings[4] = Screening.new({
  "show_time" => "16:00",
  "total_tickets" => 3,
  "film_id" => films[0].id
})

screenings[5] = Screening.new({
  "show_time" => "17:30",
  "total_tickets" => 3,
  "film_id" => films[1].id
})

screenings[6] = Screening.new({
  "show_time" => "19:00",
  "total_tickets" => 3,
  "film_id" => films[2].id
})

screenings[7] = Screening.new({
  "show_time" => "20:30",
  "total_tickets" => 3,
  "film_id" => films[3].id
})

call_save_on_all(screenings)

tickets[0] = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screenings[0].id
})

tickets[1] = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screenings[2].id
})

tickets[2] = Ticket.new({
  "customer_id" => customers[0].id,
  "screening_id" => screenings[5].id
})

tickets[3] = Ticket.new({
  "customer_id" => customers[1].id,
  "screening_id" => screenings[7].id
})

tickets[4] = Ticket.new({
  "customer_id" => customers[2].id,
  "screening_id" => screenings[1].id
})

tickets[5] = Ticket.new({
  "customer_id" => customers[2].id,
  "screening_id" => screenings[6].id
})

tickets[6] = Ticket.new({
  "customer_id" => customers[3].id,
  "screening_id" => screenings[5].id
})

tickets[7] = Ticket.new({
  "customer_id" => customers[4].id,
  "screening_id" => screenings[2].id
})

tickets[8] = Ticket.new({
  "customer_id" => customers[4].id,
  "screening_id" => screenings[1].id
})

tickets[9] = Ticket.new({
  "customer_id" => customers[5].id,
  "screening_id" => screenings[4].id
})

tickets[10] = Ticket.new({
  "customer_id" => customers[5].id,
  "screening_id" => screenings[0].id
})

tickets[11] = Ticket.new({
  "customer_id" => customers[6].id,
  "screening_id" => screenings[0].id
})

tickets[12] = Ticket.new({
  "customer_id" => customers[7].id,
  "screening_id" => screenings[7].id
})

call_save_on_all(tickets)

binding.pry
nil
