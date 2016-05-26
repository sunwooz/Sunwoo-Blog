class SubscribersController < ApplicationController

  def create
    subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if subscriber.save
        SubscriberMailer.subscribed_notification(subscriber.email).deliver!
        format.js { render layout: false }
      else
        redirect_to root_url
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :source)
  end
end
