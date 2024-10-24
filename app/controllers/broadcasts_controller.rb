class BroadcastsController < ApplicationController
  before_action :set_broadcast, only: %i[ show update destroy ]

  # Here it retrieves a list of broadcasts in Json
  def index
    @broadcasts = Broadcast.all

    render json: @broadcasts
  end

  def create
    @broadcast = Broadcast.new(broadcast_params)

    if @broadcast.save
      render json: @broadcast, status: :created, location: @broadcast
    else
      render json: @broadcast.errors, status: :unprocessable_entity
    end
  end

  def update
    if @broadcast.update(broadcast_params)
      render json: @broadcast
    else
      render json: @broadcast.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @broadcast.destroy
  end

  private
    def set_broadcast
      @broadcast = Broadcast.find(params[:id])
    end

    def broadcast_params
      params.require(:broadcast).permit(:title, :broadcast_date, :subscriptions_count)
    end
end
