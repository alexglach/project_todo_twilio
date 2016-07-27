class TextMessage

  def initialize(task, date)
    @from = ENV['TWILIO']
    @to = ENV['SELF']
    @body = "You need to complete #{task} by #{date}."
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create(:from => @from, :to => @to, :body => @body)
  end
end
