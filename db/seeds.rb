user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")
user3 = User.where(email: "test3@example.com").first_or_create(password: "password", password_confirmation: "password")
user4 = User.where(email: "test4@example.com").first_or_create(password: "password", password_confirmation: "password")



user1_apartments =[
  {
    street: "456 Bogus Blvd", 
    unit: "30", 
    city: "New York" 
    state: "NY"
    footage: 2000, 
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only"
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
  }
]

user2_apartments =[
  {
    street: "789 Fantasy Lane",
    unit: "50",
    city: "Detriot",
    state: "MI",
    square_footage: 1700,
    price: 1800,
    bedrooms: 3,
    bathrooms: 1,
    pets: "no",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
  }
]

user3_apartments =[
  {
    street: "919 Fake Street", 
    unit: "3", 
    city: "Miami" 
    state: "FL"
    footage: 6000, 
    price: 170000, 
    bedrooms: 6, 
    bathrooms: 4, 
    pets: "cats only"
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
  }
]

user4_apartments =[
  {
    street: "777 Imaginary Ave",
    unit: "5",
    city: "San Diego",
    state: "CA",
    square_footage: 700,
    price: 2800,
    bedrooms: 2,
    bathrooms: 2,
    pets: "yes",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
  }
]

user1_apartments.each do |apartment|
  user1.apartments.create(apartment)
  p "created: #{apartment}"
end

user2_apartments.each do |apartment|
  user2.apartments.create(apartment)
  p "created: #{apartment}"
end

user3_apartments.each do |apartment|
  user3.apartments.create(apartment)
  p "created: #{apartment}"
end

user4_apartments.each do |apartment|
  user4.apartments.create(apartment)
  p "created: #{apartment}"
end