require 'twilio-ruby'

# to make this code work:
# 1) Uncomment the first line
# 2) Set environmental variables in your shell profile  equal to your
#    Twilio account information with the same names as the variables below.
# 3) Pass the following code: 'Twilio::REST::Client.new(account_sid, auth_token)'
#    without '' as the client parameter.

class OrderCompleter
  def initialize(order_in_progress, client)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = client
    @from = ENV['TWILIO_NUMBER']
    @order_in_progress = order_in_progress
  end

  def complete
    @client.messages.create(
    from: @from,
    to: @order_in_progress.check.customer?,
    body: 'Thank you! Your order was placed and will be delivered before 18:52'
    )
    binding.irb
  end

end
