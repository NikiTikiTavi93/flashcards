class NotificationsMailer < ApplicationMailer
  def pending_cards
    user_ids = Card.select(:user_id)
                   .where("review_date <=?", DateTime.now)
                   .group(:user_id)
                   .pluck(:user_id)
    User.where(id: user_ids).all.each do |user|
        mail(to: user.email, subject: 'There were cards available for testing')
    end
  end
end
