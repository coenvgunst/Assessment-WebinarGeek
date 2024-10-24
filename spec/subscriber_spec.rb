require 'rails_helper'

RSpec.describe 'Subscribers', type: :request do
  let!(:broadcast) { Broadcast.create!(title: 'Fryslân Boppe', broadcast_date: Time.now) }

  let(:subscriber_attributes) do
    {
      email: 'yaboi@mail.com',
      firstname: 'Ya',
      surname: 'Boi',
      registration_ip: 'Dokkum',
      broadcast_id: broadcast.id,
      watched: false
    }
  end

  describe 'POST /subscribers' do
    context 'with valid parameters' do
      it 'creates a new Subscriber' do
        expect {
          post '/subscribers', params: { subscriber: subscriber_attributes }
        }.to change(Subscriber, :count).by(1)

        expect(response).to have_http_status(:created)

        expect(JSON.parse(response.body)['email']).to eq('yaboi@mail.com')
        expect(JSON.parse(response.body)['firstname']).to eq('Ya')
        expect(JSON.parse(response.body)['surname']).to eq('Boi')
        expect(JSON.parse(response.body)['registration_ip']).to eq('Dokkum')

        # checks if a token is generated
        expect(JSON.parse(response.body)['token']).to_not eq nil

        # Checks if it retrieves the correct broadcast
        expect(JSON.parse(response.body)['broadcast_id']).to eq(broadcast.id)
        expect(Subscriber.last.broadcast.title).to eq('Fryslân Boppe')
      end
    end
    
    # Would add specs for validations, e.g. no correct email format, no broadcast selected etc.
  end
end
