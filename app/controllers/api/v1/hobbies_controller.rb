module Api
  module V1
    class HobbiesController < ApplicationController
      def titles
        render json: { collection: Hobby.all.pluck(:title) }
      end

      def random
        render json: { resource: Hobby.all.pluck(:title).sample }
      end
    end
  end
end
