module Api
  module V1
    class RegistersController < ApplicationController
      attr_reader :exam

      def create
        user = find_or_create_user
        @exam = Exam.get_college_exam(params[:exam_id], params[:college_id]).first
        raise 'Exam or College not valid' unless exam

        raise 'Start Time is out of exam window' unless
          exam.in_time_window?(params[:start_time])

        user.registrations.create!(registration_params)
        render json: { message: 'Successfully Registered Exam!' }, status: 200

        rescue StandardError => e
          render json: { error: e.message }, status: 400
      end

      private

      def find_or_create_user
        User.where(phone_number: params[:phone_number]).first_or_create!(user_params)
      end

      def user_params
        {
          first_name: params[:first_name],
          last_name: params[:last_name],
          phone_number: params[:phone_number]
        }
      end

      def registration_params
        {
          exam_id: exam.id,
          start_time: params[:start_time]
        }
      end
    end
  end
end
