require "./spec_helper"

describe EightBallBot do
  it "handles /start command" do
    EightBallBot.new(bot_token: ENV["API_KEY"]).start_command(nil).should be_a(String)
  end

  it "hears questions" do
    EightBallBot.new(bot_token: ENV["API_KEY"]).on_question(nil).should be_a(String)
  end
end
