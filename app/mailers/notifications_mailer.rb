class NotificationsMailer < BaseMandrillMailer
  def pending_cards
    user_ids = Card.select(:user_id)
                   .where("review_date <=?", DateTime.now)
                   .group(:user_id)
                   .pluck(:user_id)

    User.where(id: user_ids).all.each do |user|
      subject = 'There were cards available for testing'
      merge_vars = {
          "Email" => user.email
      }
      body = mandrill_template("pending-cards", merge_vars)
      send_mail(user.email, subject, body)
    end
  end
end
