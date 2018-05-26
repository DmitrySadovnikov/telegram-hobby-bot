module Api
  module V1
    class HobbiesController < ApplicationController
      def message
        Hobby::MessageServer.new.call(
          text:    params[:text],
          chat_id: params.dig(:chat, :id)
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
