class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def deny_email(user)
    @user = user
    mail( :to => user.email, :subject => "InternDB Submission Update")
  end

end
