class WelcomeController < ApplicationController
  def index
  end

  def fill
    1.upto(10) do |el|
      Brand.new(name: 'BlaBla' + el.to_s, description: "HAhahahaHAHHAHAHAHA").save!
    end
  end
end
