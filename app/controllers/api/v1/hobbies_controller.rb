module Api
  module V1
    class HobbiesController < ApplicationController
      skip_before_action :verify_authenticity_token

      # {
      #   'update_id' => 394352518,
      #   'message'   =>
      #     {
      #       'message_id' => 5,
      #       'from'       =>
      #         {
      #           'id'            => 160589750,
      #           'is_bot'        => false,
      #           'first_name'    => 'Dmitry',
      #           'last_name'     => 'Sadovnikov',
      #           'username'      => 'DmitrySadovnikov',
      #           'language_code' => 'en-RU'
      #         },
      #       'chat'       =>
      #         {
      #           'id'         => 160589750,
      #           'first_name' => 'Dmitry',
      #           'last_name'  => 'Sadovnikov',
      #           'username'   => 'DmitrySadovnikov',
      #           'type'       => 'private'
      #         },
      #       'date'       => 1527367962,
      #       'text'       => 'привет'
      #     }
      # }
      def message
        return render json: {}, status: :ok unless params[:message]

        Hobby::MessageServer.new.call(
          text:    params.dig(:message, :text),
          chat_id: params.dig(:message, :chat, :id)
        )
        render json: {}, status: :ok
      end

      def titles
        render json: { collection: Hobby.all.pluck(:title) }
      end

      def random
        render json: { resource: Hobby.all.pluck(:title).sample }
      end
    end
  end
end
