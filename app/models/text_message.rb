class TextMessage

  def initialize(task, date)
    @from = ENV['from']
    @to = ENV['to']
    @body = "You need to complete #{task} by #{date}."
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create(:from => @from, :to => @to, :body => @body)
  end
end
