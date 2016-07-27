class TextMessage

  def initialize
    @from = "+441736322075"
    @to = "+447960474761"
    @body = "You have something to do"
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create(:from => @from, :to => @to, :body => @body)
  end
end
