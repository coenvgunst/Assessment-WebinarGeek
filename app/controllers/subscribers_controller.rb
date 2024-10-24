class SubscribersController < ApplicationController
  before_action :set_subscriber, only: %i[ update destroy ]

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render json: @subscriber, status: :created, location: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  def update
    if @subscriber.update(subscriber_params)
      render json: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriber.destroy
  end

  private
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_params
      params.require(:subscriber).permit(:watched, :email, :firstname, :surname, :registration_ip, :broadcast_id)
    end
end
