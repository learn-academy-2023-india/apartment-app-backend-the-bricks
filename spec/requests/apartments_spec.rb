require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  describe "GET /index" do
   it 'gets a list of apartments' do
      apartment = user.apartments.create(
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq("456 Bogus Blvd")
      expect(apartment.first['unit']).to eq("30")
      expect(apartment.first['city']).to eq("New York")
      expect(apartment.first['state']).to eq("NY")
      expect(apartment.first['square_footage']).to eq(2000)
      expect(apartment.first['price']).to eq("13000")
      expect(apartment.first['bedrooms']).to eq(5)
      expect(apartment.first['bathrooms']).to eq(3)
      expect(apartment.first['pets']).to eq("Puppets only")
      expect(apartment.first['image']).to eq("https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg")
    end
  end
  
  it 'creates a new apartment' do
    apartment_params = {
      apartment: {
      street: "456 Bogus Blvd", 
      unit: "30", 
      city: "New York",
      state: "NY",
      square_footage: 2000, 
      price: "13000", 
      bedrooms: 5, 
      bathrooms: 3, 
      pets: "Puppets only",
      image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
      user_id: user.id
      }
    }
    post '/apartments', params: apartment_params

    apartment = Apartment.first
    expect(response).to have_http_status(200)
    expect(apartment["street"]).to eq("456 Bogus Blvd")
    expect(apartment["unit"]).to eq("30")
    expect(apartment["city"]).to eq("New York")
    expect(apartment["state"]).to eq("NY")
    expect(apartment["square_footage"]).to eq(2000)
    expect(apartment["price"]).to eq("13000")
    expect(apartment["bedrooms"]).to eq(5)
    expect(apartment["bathrooms"]).to eq(3)
    expect(apartment["pets"]).to eq("Puppets only")
    expect(apartment["image"]).to eq("https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg")
    expect(apartment["user_id"]).to eq(user.id)
  end

  it "can't create without a street" do
    invalid_apartment = {
      apartment: {
        street: nil, 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["street"]).to include "can't be blank"
  end

  it "can't create without a unit" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: nil, 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["unit"]).to include "can't be blank"
  end
  
  it "can't create without a city" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: nil,
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["city"]).to include "can't be blank"
  end

  it "can't create without a state" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: nil,
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["state"]).to include "can't be blank"
  end

  it "can't create without a square_footage" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: nil, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["square_footage"]).to include "can't be blank"
  end

  it "can't create without a price" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: nil, 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["price"]).to include "can't be blank"
  end

  it "can't create without a bedrooms" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: nil, 
        bathrooms: 3, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["bedrooms"]).to include "can't be blank"
  end

  it "can't create without a bathrooms" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: nil, 
        pets: "Puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["bathrooms"]).to include "can't be blank"
  end

  it "can't create without a pets" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: nil,
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["pets"]).to include "can't be blank"
  end

  it "can't create without a image" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets",
        image: nil,
        user_id: user.id
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["image"]).to include "can't be blank"
  end

  it "can't create without a user.id" do
    invalid_apartment = {
      apartment: {
        street: "456 Bogus Blvd", 
        unit: "30", 
        city: "New York",
        state: "NY",
        square_footage: 2000, 
        price: "13000", 
        bedrooms: 5, 
        bathrooms: 3, 
        pets: "Puppets",
        image: "image.jpeg",
        user_id: nil
      }
    }

    post "/apartments", params: invalid_apartment
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["user_id"]).to include "can't be blank"
  end

end