require 'rails_helper'

RSpec.describe 'Broadcasts', type: :request do
  let!(:broadcast1) { Broadcast.create!(title: '10 facts about beavers', broadcast_date: Time.now, subscriptions_count: 10) }
  let!(:broadcast2) { Broadcast.create!(title: '11 facts about beavers', broadcast_date: Time.now + 1.day, subscriptions_count: 11) }

  describe 'GET /broadcasts' do
    it 'returns a list of broadcasts' do
      get '/broadcasts'
      json_response = JSON.parse(response.body)

      expect(json_response.size).to eq(2)

      expect(json_response[0]['title']).to eq(broadcast1.title)
      expect(json_response[0]['subscriptions_count']).to eq(broadcast1.subscriptions_count)

      expect(json_response[1]['title']).to eq(broadcast2.title)
      expect(json_response[1]['subscriptions_count']).to eq(broadcast2.subscriptions_count)
    end
  end
end
