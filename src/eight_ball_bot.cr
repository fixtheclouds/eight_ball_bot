require "tourmaline"

# TODO: Write documentation for `EightBallBot`
class EightBallBot < Tourmaline::Client
  STATEMENTS = [
    # Affirmative
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    # Non-commital
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    # Negative
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful",
  ]

  @[Command("start")]
  def start_command(ctx)
    ctx.message.reply(
      <<-STRING
      Welcome to EightBallBot!
      Send a yes-no question and get an answer.
      Be sure to include the question mark at the end.
      STRING
    )
  end

  @[Hears(/.+\?/)]
  def on_question(ctx)
    ctx.message.reply(random_statement)
  end

  private def random_statement
    STATEMENTS.sample
  end
end

bot = EightBallBot.new(bot_token: ENV["API_KEY"])
bot.poll
