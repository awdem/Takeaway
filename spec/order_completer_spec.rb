require 'order_completer'


RSpec.describe OrderCompleter do
  context "given a finalized order" do
    it "text customer with message" do
      client_dbl = double :client
      message_instance_dbl = :message_instance
      menu = double :menu
      new_order = double :order, customer?: "+4401000000000"
      order_in_progress = double :order_maker, check: new_order
      finalized_order = OrderCompleter.new(order_in_progress, client_dbl)
      
      expect(client_dbl).to receive(:messages)
        .and_return(message_instance_dbl)
      expect(message_instance_dbl).to receive(:create)
        .with(
          from: @from,
          to: order_in_progress.check.customer?,
          body: 'Thank you! Your order was placed and will be delivered before 18:52'
          )
        .and_return('{
          "account_sid": "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
          "api_version": "2010-04-01",
          "body": "Thank you! Your order was placed and will be delivered before 18:52",
          "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
          "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
          "direction": "outbound-api",
          "error_code": null,
          "error_message": null,
          "from": "+14155552345",
          "messaging_service_sid": null,
          "num_media": "0",
          "num_segments": "1",
          "price": null,
          "price_unit": null,
          "sid": "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
          "status": "sent",
          "subresource_uris": {
            "media": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Media.json"
          },
          "to": "+14155552345",
          "uri": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json"
        }')


      expect(finalized_order.complete).to eq [??]# => texts customer with message like: 'Thank you! Your order was placed and
      #  will be delivered before 18:52'        
    end
  end
end