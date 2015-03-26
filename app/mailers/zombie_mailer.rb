class ZombieMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.decomp_change.subject
  #
  def decomp_change(zombie)
    @zombie = zombie
    @tweets = @zombie.tweets

    #attachments['z.pdf'] = File.read("#{Rails.root}/public/zombie.pdf")
    mail to: @zombie.email, subject: 'Your decomp stage has changed'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.lost_brain.subject
  #
  def lost_brain
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
