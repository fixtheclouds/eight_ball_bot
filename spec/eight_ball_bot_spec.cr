require "./spec_helper"

describe EightBallBot do
  it "works" do
    EightBallBot.new(bot_token: ENV["API_KEY"]).start_command(nil).should be_a(String)
  end
end
