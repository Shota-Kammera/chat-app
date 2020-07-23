class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller? #devise_controllerから呼び出された場合は、configure_permitted_parametersメソッドが呼ばれます。

  protected

  def configure_permitted_parameters #configure_permitted_parametersの定義付け
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #devise_parameter_sanitizerはdeviseをインストールすることで使用可能 特定のカラムを許容する
  end #「name」キーの内容の保存をpermitメソッドで許可しています。
end
