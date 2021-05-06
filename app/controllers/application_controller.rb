class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'  # 環境変数を読み込む記述に変更
    end
  end
end
