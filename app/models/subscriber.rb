require 'securerandom'

class Subscriber < ApplicationRecord
  belongs_to :broadcast

  after_create :create_token

  private
    # Generates a random hexadecimal token and updates the current record with it.
    # 
    # @return [Boolean] true if the record was successfully updated, false otherwise
    def create_token
      generated_token = SecureRandom.hex
      self.update(token: generated_token)
    end
end
