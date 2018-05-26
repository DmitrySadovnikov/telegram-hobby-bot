class Hobby::MessageServer
  def call(text:, chat_id:)
    text =
      case text.downcase
      when 'привет' then 'Ну привет'
      when 'all'    then  Hobby.all.pluck(:title)
      else                Hobby.all.pluck(:title).sample
      end

    post chat_id: chat_id, text: text
  end

  private

  def post(params)
    Net::HTTP.post_form(
      URI.parse("https://api.telegram.org/bot#{ENV['TELEGRAM_HOBBY_BOT_KEY']}/sendMessage"),
      params
    )
  end
end
