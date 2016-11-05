
every :day, :at => '09:00 am' do
  runner "NotificationsMailer.pending_cards.deliver"
end
