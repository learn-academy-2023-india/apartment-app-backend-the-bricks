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
      price: 13000, 
      bedrooms: 5, 
      bathrooms: 3, 
      pets: "Puppets only",
      image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg" 
    )
    get '/apartments'

    apartment = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(apartment.first['street']).to eq("456 Bogus Blvd")
  end
end

end