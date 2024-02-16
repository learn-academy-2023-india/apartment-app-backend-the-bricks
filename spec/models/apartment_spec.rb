require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do 
    apartment = user.apartments.create(
    unit: "30", 
    city: "New York",
    state: "NY",
    square_footage: 2000, 
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",    
    city: "New York", 
    state: "NY",
    square_footage: 2000, 
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate city' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",   
    state: "NY",
    square_footage: 2000, 
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it 'should validate state' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",   
    city: "NY",    
    square_footage: 2000, 
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it 'should validate sqaure_footage' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    price: 13000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it 'should validate price' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    bedrooms: 5, 
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    price: 13000,
    bathrooms: 3, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it 'should validate bathrooms' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    price: 13000,
    bedrooms: 5, 
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it 'should validate pets' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    price: 13000,
    bedrooms: 5, 
    bathrooms: 3,
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it 'should validate image' do 
    apartment = user.apartments.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    price: 13000,
    bedrooms: 5, 
    bathrooms: 3,
    pets: "Puppets only"
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end

  it 'should validate user_id' do 
    apartment = Apartment.create(
    street: "456 Bogus Blvd",
    unit: "30",
    state: "NY",   
    city: "New York",    
    square_footage: 2000, 
    price: 13000,
    bedrooms: 5, 
    bathrooms: 3,
    pets: "Puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
    )
    expect(apartment.errors[:user_id]).to include("can't be blank")
  end
end
