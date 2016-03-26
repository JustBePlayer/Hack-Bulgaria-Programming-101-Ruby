class WelcomeController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "QD4UUeWWA2cFtA1SBOF7EVzON"
    config.consumer_secret     = "PjAGrliks4wuXXneZ4n6jrwCcGtotbgrUZ0PvH4Ne7b2cxFhnt"
    config.access_token        = "2476858352-Sr1gawaD2OVjWExTVUvRswKFhceDaftzzDBoZoq"
    config.access_token_secret = "cGKiptKg7AP7HdzQnMQIgeVJwfgIIDQJaXszv1OYFsbbZ"
  end

    #render json:  client.user_timeline.first.text

    @posts = [].tap do |arr|
      client.user_timeline.each do |status|
        arr << {"text" => status.text, "type" => TweetStatus.status(status.text)}
      end
    end
  end

end
