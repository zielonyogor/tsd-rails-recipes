class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    redirect_target = if exception.record.respond_to?(:persisted?) && exception.record.persisted?
      exception.record
    else
      recipes_path
    end

    redirect_to redirect_target, alert: "You are not authorized to edit this recipe."
  end
end
