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

end