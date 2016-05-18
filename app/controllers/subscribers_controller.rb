class SubscribersController < ApplicationController

  def create
    subscriber = Subscriber.new(subscriber_params)
    if subscriber.save
      flash[:notice] = "Thanks for Subscribing!"
      SubscriberMailer.subscribed_notification(subscriber.email).deliver!
      redirect_to :back, notice: 'Thanks for subscribing!'
    else
      redirect_to :back, error: 'Could not subscribe!?'
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :source)
  end
end
