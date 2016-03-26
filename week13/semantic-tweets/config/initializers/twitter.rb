twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['MkJuw43ZeYzyQq0MpbrtqcuiV']
  config.consumer_secret = ENV['NHgR6lzgAaPZSyQenjEMw7ucdDf2yhDBJpVgIyGdgAjmucVrG0']
  config.access_token = ENV['YOUR_ACCESS_TOKEN']
  config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
end
