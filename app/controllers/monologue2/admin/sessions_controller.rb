class Monologue2::Admin::SessionsController < Monologue2::Admin::BaseController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    user = Monologue2::User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:monologue2_user_id] = user.id
      redirect_to admin_url, notice: t("monologue2.admin.sessions.messages.logged_in")
    else
      flash.now.alert = t("monologue2.admin.sessions.messages.invalid")
      render "new"
    end
  end

  def destroy
    session[:monologue2_user_id] = nil
    redirect_to admin_url, notice: t("monologue2.admin.sessions.messages.logged_out")
  end
end
