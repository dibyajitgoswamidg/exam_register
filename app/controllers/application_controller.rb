class ApplicationController < ActionController::API
  after_action :log_request_response

  private

  def log_request_response
    @current_request = ApiRequest.create!(
      endpoint: request.fullpath,
      payload: request.params.to_json,
      response: response.body + ' status: ' + response.code
    )
  end
end
