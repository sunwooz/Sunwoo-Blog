class SubscriberMailer < ActionMailer::Base
  default from: "sunwooyang@gmail.com"

  def subscribed_notification(email)
    @email = email
    mail(to: "yangsunwoo@gmail.com", subject: "#{@email} subscribed to your blog!", from: 'yangsunwoo@gmail.com')
  end
end
