require 'active_support/concern'

module Monologue2
  module ControllerHelpers
    module Auth
      extend ActiveSupport::Concern
      include Monologue2::ControllerHelpers::User

      included do
        before_filter :authenticate_user!
      end

      private
      def authenticate_user!
         if monologue_current_user.nil?
           redirect_to monologue2.admin_login_url, alert: I18n.t("monologue2.admin.login.need_auth")
         end
      end
    end
  end
end
