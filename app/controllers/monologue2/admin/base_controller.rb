class Monologue2::Admin::BaseController < Monologue2::ApplicationController
  include Monologue2::ControllerHelpers::Auth
  force_ssl if Monologue2::Config.admin_force_ssl # TODO: find a way to test that with capybara

  layout "layouts/monologue2/admin"
end
