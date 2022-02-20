require "tourmaline"

# TODO: Write documentation for `EightBallBot`
class EightBallBot < Tourmaline::Client
  STATEMENTS = [
    "Yes",
    "Most likey",
    "No",
    "Never",
    "Don`t count on it"
  ]

  @[Command("shake")]
  def shake_command(ctx)
    ctx.message.reply(random_statement)
  end

  private def random_statement
    STATEMENTS.sample
  end
end

bot = EightBallBot.new(bot_token: ENV["API_KEY"])
bot.poll
