require 'active_support/concern'

module Monologue2
  module ControllerHelpers
    module User
      extend ActiveSupport::Concern

      included do
        helper_method :monologue_current_user
      end

      private
      def monologue_current_user
        @monologue_current_user ||= Monologue2::User.find(session[:monologue2_user_id]) if session[:monologue2_user_id]
      end
    end
  end
end
