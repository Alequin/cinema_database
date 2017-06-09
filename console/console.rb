require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/Screening.rb")

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
  "name" => "Benjaman Kyle",
  "money" => 130
})

customer_1.save()
customer_2.save()
customer_3.save()

customer_1.name = "Jane Doe"
customer_1.increase_money_by(1000)
customer_1.decrease_money_by(600)
customer_1.update()

customer_4 = Customer.find(customer_1.id)

all_customers = Customer.get_all()

# customer_1.delete()
# customer_2.delete()
# customer_3.delete()

film_1 = Film.new({
  "title" => "Your Name",
  "cost" => 5
})
film_1.save()

screening_1 = Screening.new({
    "film_id" => film_1.id,
    "show_time" => "12:00",
    "total_tickets" => 10
})
screening_1.save()
screening_1.show_time = "14:00"
screening_1.update()

binding.pry
nil
