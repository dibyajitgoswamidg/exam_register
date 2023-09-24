# frozen_string_literal: true

require 'rails_helper'
Rails.application.load_seed

RSpec.describe Api::V1::RegistersController, type: :controller do
  context '#create' do
    describe 'create request failures' do
      it 'should fail if the phone number is not valid' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '922112777',
          college_id: 1,
          exam_id: 1,
          start_time: '2023-10-4 09:00:00'
        }

        post :create, params: params
        expect(response).to have_http_status(400)
        expect(response.body).to include('Validation failed: Phone number is not valid')
      end

      it 'should fail if the given college_id is not valid' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '9221127774',
          college_id: 101,
          exam_id: 1,
          start_time: '2023-10-4 09:00:00'
        }

        post :create, params: params
        expect(response).to have_http_status(400)
        expect(response.body).to include('Exam or College not valid')
      end

      it 'should fail if the given exam_id is not valid' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '9221127774',
          college_id: 1,
          exam_id: 101,
          start_time: '2023-10-4 09:00:00'
        }

        post :create, params: params
        expect(response).to have_http_status(400)
        expect(response.body).to include('Exam or College not valid')
      end

      it 'should fail if the start time is not in window' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '9221127774',
          college_id: 1,
          exam_id: 1,
          start_time: '2023-10-4 09:00:00'
        }
        post :create, params: params
        expect(response).to have_http_status(400)
        expect(response.body).to include('Start Time is out of exam window')
      end
    end

    describe 'register a new exam for user' do
      it 'should create a new registration' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '9221127774',
          college_id: 1,
          exam_id: 1,
          start_time: '2023-10-4 10:00:00'
        }
        post :create, params: params
        expect(response).to be_successful
        expect(response.body).to include('Successfully Registered Exam!')
      end

      it 'should have a api request log for new registration' do
        params = {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '9221127774',
          college_id: 1,
          exam_id: 1,
          start_time: '2023-10-4 11:00:00'
        }
        expect do
          post :create, params: params
        end.to change { ApiRequest.count }.by 1
      end
    end
  end
end
